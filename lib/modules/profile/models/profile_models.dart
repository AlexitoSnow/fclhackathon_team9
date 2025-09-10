class UserProfile {
  final String id;
  final String name;
  final String username;
  final String bio;
  final String avatarUrl;
  final int steps;
  final int followers;
  final int following;
  final String goal;

  const UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.avatarUrl,
    required this.steps,
    required this.followers,
    required this.following,
    required this.goal,
  });

  UserProfile copyWith({
    String? id,
    String? name,
    String? username,
    String? bio,
    String? avatarUrl,
    int? steps,
    int? followers,
    int? following,
    String? goal,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      steps: steps ?? this.steps,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      goal: goal ?? this.goal,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.bio == bio &&
        other.avatarUrl == avatarUrl &&
        other.steps == steps &&
        other.followers == followers &&
        other.following == following &&
        other.goal == goal;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      bio.hashCode ^
      avatarUrl.hashCode ^
      steps.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      goal.hashCode;
}

class TrophyProgress {
  final int currentSteps;
  final int targetSteps;
  final String stage;
  final String stageDescription;

  const TrophyProgress({
    required this.currentSteps,
    required this.targetSteps,
    required this.stage,
    required this.stageDescription,
  });

  TrophyProgress copyWith({
    int? currentSteps,
    int? targetSteps,
    String? stage,
    String? stageDescription,
  }) {
    return TrophyProgress(
      currentSteps: currentSteps ?? this.currentSteps,
      targetSteps: targetSteps ?? this.targetSteps,
      stage: stage ?? this.stage,
      stageDescription: stageDescription ?? this.stageDescription,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrophyProgress &&
        other.currentSteps == currentSteps &&
        other.targetSteps == targetSteps &&
        other.stage == stage &&
        other.stageDescription == stageDescription;
  }

  @override
  int get hashCode =>
      currentSteps.hashCode ^
      targetSteps.hashCode ^
      stage.hashCode ^
      stageDescription.hashCode;
}

class Achievement {
  final String id;
  final String name;
  final String description;
  final bool isUnlocked;
  final String iconPath;

  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.isUnlocked,
    required this.iconPath,
  });

  Achievement copyWith({
    String? id,
    String? name,
    String? description,
    bool? isUnlocked,
    String? iconPath,
  }) {
    return Achievement(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Achievement &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.isUnlocked == isUnlocked &&
        other.iconPath == iconPath;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      isUnlocked.hashCode ^
      iconPath.hashCode;
}
