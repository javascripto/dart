
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: TransferenceList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

class TransferenceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferenceItem(amount: '100.0', account: '1000'),
        TransferenceItem(amount: '200.0', account: '1000'),
        TransferenceItem(amount: '400.0', account: '1000'),
        TransferenceItem(amount: '700.0', account: '1000'),
      ] + List.generate(4, (index) => (
        TransferenceItem(
          amount: (Random().nextInt(100000) / 100).toStringAsFixed(2),
          account: '1000',
        )
      )),
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
        leading: Icon(Icons.monetization_on),
        title: Text(amount),
        subtitle: Text(account),
      ),
    );
  }
}
