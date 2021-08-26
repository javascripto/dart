import 'package:dartbank/Client.dart';

class BankAccount {
  late Client owner;
  late int agency;
  late int accountNumber;
  late double balance = 0.0;

  bool get isBalancePositive => balance > 0;

  BankAccount(
    Client owner,
    int agency,
    int accountNumber,
    { double balance = 0.0 } // default value / optional initialization with named argument
  ) {
    this.owner = owner;
    this.agency = agency;
    this.balance = balance;
    this.accountNumber = accountNumber;
  }

  void deposit(double amount) {
    balance += amount;
  }

  double withdraw(double amount) {
    if (amount > balance) return 0;
    balance -= amount;
    return amount;
  }

  void transfer(double amount, BankAccount destination) {
    if (amount > balance) {
      throw Exception('Insuficient balance');
    }
    destination.deposit(withdraw(amount));
  }

  @override
  String toString() {
    return '{owner: ${owner.name}, balance: $balance}';
  }
}
