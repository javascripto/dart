
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TransferenceForm(),
    );
  }
}

class TransferenceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Column(
        children: [
          TransferenceItem(amount: '100.0', account: '1000'),
          TransferenceItem(amount: '200.0', account: '1000'),
        ] + List.generate(4, (index) => (
          TransferenceItem(
            amount: (Random().nextInt(100000) / 100).toStringAsFixed(2),
            account: '1000',
          )
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.green.shade900,
      ),
    );
  }
}

class TransferenceItem extends StatelessWidget {
  final String amount;
  final String account;

  TransferenceItem({ required this.amount, required this.account });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
          color: Colors.green.shade900,
        ),
        title: Text(amount),
        subtitle: Text(account),
      ),
    );
  }
}

class TransferenceForm extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transferencia'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _accountController,
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
                prefixIcon: Icon(Icons.account_balance),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: '0.00',
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  var account = int.tryParse(_accountController.text);
                  var amount = double.tryParse(_amountController.text);
                  if (amount == null || account == null) {
                    return debugPrint('Não foi possível parsear valores');
                  }
                  var transference = Transference(
                    account: account,
                    amount: amount,
                  );
                  debugPrint(transference.toString());
                  _amountController.clear();
                  _accountController.clear();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Confirmar'),
                ),
                style: ButtonStyle(),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class Transference {
  final int account;
  final double amount;

  Transference({ required this.account, required this.amount });

  @override
  String toString() {
    return 'Transference{account: $account, amount: $amount}';
  }
}
