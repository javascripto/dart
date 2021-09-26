
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
      home: TransferenceList(),
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
        onPressed: () => _openTransferenceForm(context),
        backgroundColor: Colors.green.shade900,
      ),
    );
  }

  void _openTransferenceForm(BuildContext context) {
    Navigator.push<Transference>(
      context,
      MaterialPageRoute(
        builder: (context) => TransferenceForm(),
      ),
    ).then((transference) {
      if (transference == null) return;
      showAlert(context, 'Sucesso', '$transference');
    });
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
        title: Text('Nova transferência'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Editor(
              hint: '0000',
              label: 'Número da conta',
              icon: Icons.account_balance,
              keyboardType: TextInputType.number,
              controller: _accountController,
            ),
            Editor(
                hint: '0.00',
                label: 'Valor',
                icon: Icons.monetization_on,
                keyboardType: TextInputType.number,
                controller: _amountController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () => _createTransference(context),
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

  void _createTransference(BuildContext context) {
    final account = int.tryParse(_accountController.text);
    final amount = double.tryParse(_amountController.text);
    if (amount == null || account == null) {
      return showAlert(context, 'Erro', 'Não foi possível parsear valores');
    }
    final transference = Transference(
      account: account,
      amount: amount,
    );
    _amountController.clear();
    _accountController.clear();
    debugPrint('Transferência criada! Enviando para lista de transferências');
    Navigator.pop(context, transference);
  }
}

class Transference {
  final int account;
  final double amount;

  Transference({ required this.account, required this.amount });

  @override
  String toString() {
    return 'Transference {\n  account: $account,\n  amount: $amount\n}';
  }
}

class Editor extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  Editor({ this.icon, this.hint, this.label, this.keyboardType, this.controller });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      keyboardType: keyboardType,
    );
  }
}

void showAlert(BuildContext context, String? title, String content) {
  debugPrint(content);
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      actions: [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
        ),
      ],
      content: Text(content),
    );
  });
}