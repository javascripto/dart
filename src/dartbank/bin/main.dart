import 'package:dartbank/Client.dart';
import 'package:dartbank/BankAccount.dart';

void main (List<String> arguments) {
  var john = Client('John', '12312312312');
  var jane = Client('Jane', '45645645645');

  var johnAccount = BankAccount(john, 001, 1);
  var johnAccountClone = BankAccount(john, 001, 1);
  var janeAccount = BankAccount(jane, 001, 2, balance: 10.0); // overriding default balance 

  print(johnAccount == johnAccountClone);
  print('HashCodes: ${johnAccount.hashCode} ${johnAccountClone.hashCode}');

  johnAccount.deposit(100);
  johnAccount.withdraw(50);

  try {
    johnAccount.transfer(15, janeAccount);
  } catch (e) {
    print(e);
  }

  print(johnAccount);
  print(janeAccount);
}
