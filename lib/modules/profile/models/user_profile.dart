enum Gender { male, female, other }

class UserProfile {
  final String name;
  final double heightCm;
  final double weightKg;
  final Gender gender;
  const UserProfile({
    required this.name,
    required this.heightCm,
    required this.weightKg,
    required this.gender,
  });

  UserProfile copyWith({
    String? name,
    double? heightCm,
    double? weightKg,
    Gender? gender,
  }) {
    return UserProfile(
      name: name ?? this.name,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      gender: gender ?? this.gender,
    );
  }
}