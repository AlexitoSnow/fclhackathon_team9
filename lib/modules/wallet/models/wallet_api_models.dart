class WalletEarningsResponse {
  final double totalWalletValue;
  final double monthlyEarning;
  final double monthlyTarget;

  const WalletEarningsResponse({
    required this.totalWalletValue,
    required this.monthlyEarning,
    required this.monthlyTarget,
  });

  factory WalletEarningsResponse.fromJson(Map<String, dynamic> json) {
    return WalletEarningsResponse(
      totalWalletValue: (json['total_wallet_value'] as num).toDouble(),
      monthlyEarning: (json['monthly_earning'] as num).toDouble(),
      monthlyTarget: (json['monthly_target'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_wallet_value': totalWalletValue,
      'monthly_earning': monthlyEarning,
      'monthly_target': monthlyTarget,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WalletEarningsResponse &&
        other.totalWalletValue == totalWalletValue &&
        other.monthlyEarning == monthlyEarning &&
        other.monthlyTarget == monthlyTarget;
  }

  @override
  int get hashCode =>
      totalWalletValue.hashCode ^
      monthlyEarning.hashCode ^
      monthlyTarget.hashCode;

  @override
  String toString() {
    return 'WalletEarningsResponse(totalWalletValue: $totalWalletValue, monthlyEarning: $monthlyEarning, monthlyTarget: $monthlyTarget)';
  }
}
