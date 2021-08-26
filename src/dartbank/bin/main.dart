import 'package:dartbank/BankAccount.dart';

void main (List<String> arguments) {
  var johnAccount = BankAccount('John', 001, 1);
  var johnAccountClone = BankAccount('John', 001, 1);
  var janeAccount = BankAccount('Jane', 001, 2, balance: 10.0); // overriding default balance 

  print(johnAccount == johnAccountClone);
  print('HashCodes: ${johnAccount.hashCode} ${johnAccountClone.hashCode}');

  johnAccount.deposit(100);
  johnAccount.withdraw(50);
  johnAccount.transfer(15, janeAccount);

  print(johnAccount);
  print(janeAccount);
}
