class WalletData {
  final double balance;
  final double monthlyEarnings;
  final double monthlyTarget;
  final double progress;

  const WalletData({
    required this.balance,
    required this.monthlyEarnings,
    required this.monthlyTarget,
    required this.progress,
  });

  WalletData copyWith({
    double? balance,
    double? monthlyEarnings,
    double? monthlyTarget,
    double? progress,
  }) {
    return WalletData(
      balance: balance ?? this.balance,
      monthlyEarnings: monthlyEarnings ?? this.monthlyEarnings,
      monthlyTarget: monthlyTarget ?? this.monthlyTarget,
      progress: progress ?? this.progress,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WalletData &&
        other.balance == balance &&
        other.monthlyEarnings == monthlyEarnings &&
        other.monthlyTarget == monthlyTarget &&
        other.progress == progress;
  }

  @override
  int get hashCode =>
      balance.hashCode ^
      monthlyEarnings.hashCode ^
      monthlyTarget.hashCode ^
      progress.hashCode;
}

class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final String category;

  const Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });

  Transaction copyWith({
    String? id,
    String? description,
    double? amount,
    DateTime? date,
    TransactionType? type,
    String? category,
  }) {
    return Transaction(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      type: type ?? this.type,
      category: category ?? this.category,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Transaction &&
        other.id == id &&
        other.description == description &&
        other.amount == amount &&
        other.date == date &&
        other.type == type &&
        other.category == category;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      description.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      type.hashCode ^
      category.hashCode;
}

enum TransactionType { credit, debit }

class Notification {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;
  final NotificationType type;

  const Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
    required this.type,
  });

  Notification copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? date,
    bool? isRead,
    NotificationType? type,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      date: date ?? this.date,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Notification &&
        other.id == id &&
        other.title == title &&
        other.message == message &&
        other.date == date &&
        other.isRead == isRead &&
        other.type == type;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      message.hashCode ^
      date.hashCode ^
      isRead.hashCode ^
      type.hashCode;
}

enum NotificationType { achievement, transaction, reminder, system }
