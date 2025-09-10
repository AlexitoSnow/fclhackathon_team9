import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/profile/models/profile_models.dart';
import 'package:fclhackathon_team9/core/services/profile_api_service.dart';

class ProfileController extends GetxController {
  // Services
  final ProfileApiService _apiService = ProfileApiService.instance;

  // Observable variables
  final Rx<UserProfile> _userProfile = const UserProfile(
    id: '1',
    name: 'Krystal Patel',
    username: 'kpatel2001',
    bio: 'I want to earn the 10 M step trophy',
    avatarUrl: '',
    steps: 0,
    followers: 0,
    following: 0,
    goal: '10 M step trophy',
  ).obs;

  final Rx<TrophyProgress> _trophyProgress = const TrophyProgress(
    currentSteps: 0,
    targetSteps: 2500000, // 2.5M steps
    stage: 'Bronze Stage',
    stageDescription: '2.5M Steps',
  ).obs;

  final RxList<Achievement> _achievements = <Achievement>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  UserProfile get userProfile => _userProfile.value;
  TrophyProgress get trophyProgress => _trophyProgress.value;
  List<Achievement> get achievements => _achievements;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    _initializeAchievements();
    fetchProfile();
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  void _initializeAchievements() {
    _achievements.value = List.generate(4, (index) {
      return Achievement(
        id: 'achievement_$index',
        name: 'Achievement ${index + 1}',
        description: 'Complete challenges to unlock',
        isUnlocked: false,
        iconPath: '',
      );
    });
  }

  /// Fetch profile data from the API
  Future<void> fetchProfile() async {
    try {
      setLoading(true);
      _errorMessage.value = '';

      final response = await _apiService.fetchProfile();

      // Update the profile data with API response
      _userProfile.value = _userProfile.value.copyWith(
        name: response.name,
        username: response.username,
        bio: response.bio,
        avatarUrl: response.imgUrl,
        steps: response.steps.toInt(),
        followers: response.followers.toInt(),
        following: response.following.toInt(),
      );

      // Update trophy progress with new steps
      _updateTrophyProgress(response.steps.toInt());
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      setLoading(false);
    }
  }

  /// Refresh profile data
  Future<void> refreshProfile() async {
    await fetchProfile();
  }

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  void clearErrorMessage() {
    _errorMessage.value = '';
  }

  void updateUserProfile(UserProfile newProfile) {
    _userProfile.value = newProfile;
  }

  void updateSteps(int steps) {
    _userProfile.value = _userProfile.value.copyWith(steps: steps);
    _updateTrophyProgress(steps);
  }

  void _updateTrophyProgress(int currentSteps) {
    _trophyProgress.value = _trophyProgress.value.copyWith(
      currentSteps: currentSteps,
    );
  }

  void updateFollowers(int followers) {
    _userProfile.value = _userProfile.value.copyWith(followers: followers);
  }

  void updateFollowing(int following) {
    _userProfile.value = _userProfile.value.copyWith(following: following);
  }

  void updateBio(String bio) {
    _userProfile.value = _userProfile.value.copyWith(bio: bio);
  }

  void updateGoal(String goal) {
    _userProfile.value = _userProfile.value.copyWith(goal: goal);
  }

  void unlockAchievement(String achievementId) {
    final index = _achievements.indexWhere(
      (achievement) => achievement.id == achievementId,
    );
    if (index != -1) {
      _achievements[index] = _achievements[index].copyWith(isUnlocked: true);
      _achievements.refresh();
    }
  }

  void editProfile() {
    // Implement profile editing logic
    // This could navigate to an edit profile screen
  }

  void shareProfile() {
    // Implement profile sharing logic
    // This could open a share dialog
  }

  void addFriend() {
    Get.snackbar("In development", "This feature is not available yet");
    // Implement add friend logic
    // This could open a friend search or QR scanner
  }

  String get stepsText => '${_userProfile.value.steps} Steps';
  String get followersText => '${_userProfile.value.followers} followers';
  String get followingText => '${_userProfile.value.following} following';
  String get trophyStepsText => '${_trophyProgress.value.currentSteps} Steps';

  // Progress percentage for trophy
  double get trophyProgressPercentage =>
      _trophyProgress.value.currentSteps / _trophyProgress.value.targetSteps;
}
