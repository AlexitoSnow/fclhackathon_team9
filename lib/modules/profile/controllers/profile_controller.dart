import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/profile/models/user_profile.dart';

class ProfileController extends GetxController {
  final nameCtrl = TextEditingController(text: 'Sophia');
  final heightCtrl = TextEditingController(text: '157 cm');
  final weightCtrl = TextEditingController(text: '40 Kg');

  final selectedGender = Gender.female.obs;
  final isSaving = false.obs;

  final _profile = const UserProfile(
    name: 'Sophia',
    heightCm: 157,
    weightKg: 40,
    gender: Gender.female,
  ).obs;

  UserProfile get profile => _profile.value;

  void selectGender(Gender g) {
    selectedGender.value = g;
  }

  Future<void> save() async {
    final parsed = _parseInputs();
    if (parsed == null) {
      Get.snackbar('Save Changes', 'Please complete all fields with valid values', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isSaving.value = true;
    await Future<void>.delayed(const Duration(milliseconds: 350));
    _profile.value = _profile.value.copyWith(
      name: parsed.$1,
      heightCm: parsed.$2,
      weightKg: parsed.$3,
      gender: selectedGender.value,
    );
    isSaving.value = false;
    Get.snackbar('Save Changes', 'Profile updated successfully', snackPosition: SnackPosition.BOTTOM);
  }

  (String, double, double)? _parseInputs() {
    final name = nameCtrl.text.trim();
    if (name.isEmpty) return null;
    final h = _extractNumber(heightCtrl.text);
    final w = _extractNumber(weightCtrl.text);
    if (h == null || w == null) return null;
    if (h <= 0 || w <= 0) return null;
    return (name, h, w);
  }

  double? _extractNumber(String input) {
    final cleaned = input.replaceAll(RegExp('[^0-9\.]'), '');
    return double.tryParse(cleaned);
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    heightCtrl.dispose();
    weightCtrl.dispose();
    super.onClose();
  }
}