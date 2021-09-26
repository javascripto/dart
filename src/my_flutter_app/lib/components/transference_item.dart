import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/transference.dart';

class TransferenceItem extends StatelessWidget {
  final Transference transference;

  TransferenceItem({ required this.transference });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
          color: Theme.of(context).accentColor,
        ),
        title: Text('${transference.amount}'),
        subtitle: Text('${transference.account}'),
      ),
    );
  }
}
