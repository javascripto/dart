class Transference {
  final int account;
  final double amount;

  Transference({ required this.account, required this.amount });

  @override
  String toString() {
    return 'Transference {\n  account: $account,\n  amount: $amount\n}';
  }
}
