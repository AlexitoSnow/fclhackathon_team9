class StreakDay {
  final String day;
  final bool isCompleted;

  const StreakDay({required this.day, required this.isCompleted});

  StreakDay copyWith({String? day, bool? isCompleted}) {
    return StreakDay(
      day: day ?? this.day,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StreakDay &&
        other.day == day &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => day.hashCode ^ isCompleted.hashCode;
}

class HomeStats {
  final double progress;
  final int currentSteps;
  final int goalSteps;
  final int balance;

  const HomeStats({
    required this.progress,
    required this.currentSteps,
    required this.goalSteps,
    required this.balance,
  });

  HomeStats copyWith({
    double? progress,
    int? currentSteps,
    int? goalSteps,
    int? balance,
  }) {
    return HomeStats(
      progress: progress ?? this.progress,
      currentSteps: currentSteps ?? this.currentSteps,
      goalSteps: goalSteps ?? this.goalSteps,
      balance: balance ?? this.balance,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeStats &&
        other.progress == progress &&
        other.currentSteps == currentSteps &&
        other.goalSteps == goalSteps &&
        other.balance == balance;
  }

  @override
  int get hashCode =>
      progress.hashCode ^
      currentSteps.hashCode ^
      goalSteps.hashCode ^
      balance.hashCode;
}
