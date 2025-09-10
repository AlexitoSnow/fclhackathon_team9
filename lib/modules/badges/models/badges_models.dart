class Badge {
  final String id;
  final String name;
  final String description;
  final bool isUnlocked;
  final String iconPath;
  final int requiredSteps;

  const Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.isUnlocked,
    required this.iconPath,
    required this.requiredSteps,
  });

  Badge copyWith({
    String? id,
    String? name,
    String? description,
    bool? isUnlocked,
    String? iconPath,
    int? requiredSteps,
  }) {
    return Badge(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      iconPath: iconPath ?? this.iconPath,
      requiredSteps: requiredSteps ?? this.requiredSteps,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Badge &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.isUnlocked == isUnlocked &&
        other.iconPath == iconPath &&
        other.requiredSteps == requiredSteps;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      isUnlocked.hashCode ^
      iconPath.hashCode ^
      requiredSteps.hashCode;
}

class CalendarDay {
  final int day;
  final bool isCompleted;
  final bool isCurrentMonth;

  const CalendarDay({
    required this.day,
    required this.isCompleted,
    required this.isCurrentMonth,
  });

  CalendarDay copyWith({int? day, bool? isCompleted, bool? isCurrentMonth}) {
    return CalendarDay(
      day: day ?? this.day,
      isCompleted: isCompleted ?? this.isCompleted,
      isCurrentMonth: isCurrentMonth ?? this.isCurrentMonth,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CalendarDay &&
        other.day == day &&
        other.isCompleted == isCompleted &&
        other.isCurrentMonth == isCurrentMonth;
  }

  @override
  int get hashCode =>
      day.hashCode ^ isCompleted.hashCode ^ isCurrentMonth.hashCode;
}

class MonthlyEarnings {
  final double currentEarnings;
  final double targetEarnings;
  final double progress;

  const MonthlyEarnings({
    required this.currentEarnings,
    required this.targetEarnings,
    required this.progress,
  });

  MonthlyEarnings copyWith({
    double? currentEarnings,
    double? targetEarnings,
    double? progress,
  }) {
    return MonthlyEarnings(
      currentEarnings: currentEarnings ?? this.currentEarnings,
      targetEarnings: targetEarnings ?? this.targetEarnings,
      progress: progress ?? this.progress,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MonthlyEarnings &&
        other.currentEarnings == currentEarnings &&
        other.targetEarnings == targetEarnings &&
        other.progress == progress;
  }

  @override
  int get hashCode =>
      currentEarnings.hashCode ^ targetEarnings.hashCode ^ progress.hashCode;
}
