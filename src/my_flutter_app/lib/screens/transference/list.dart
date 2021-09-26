import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/transference.dart';
import 'package:my_flutter_app/screens/transference/form.dart';
import 'package:my_flutter_app/components/transference_item.dart';

class TransferenceList extends StatefulWidget {
  final transferenceList = <Transference>[];

  @override
  State<TransferenceList> createState() {
    return _TransferenceListState();
  }
}

// Column não é adequado para renderizar listas de items, usamos ListView.
// ListView não é usado para listas dinâmicas, nesse caso usamos ListView.builder.

class _TransferenceListState extends State<TransferenceList> {
  final _screenTitle = 'Transferências';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      body: ListView.builder(
        itemCount: widget.transferenceList.length,
        itemBuilder: (context, index) => (
          TransferenceItem(transference: widget.transferenceList[index])
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransferenceForm(context),
      ),
    );
  }

  void _openTransferenceForm(BuildContext context) {
    Navigator.push<Transference>(context, MaterialPageRoute(
      builder: (context) => TransferenceForm(),
    )).then(_addTransferenceIfCreated);
  }

  void _addTransferenceIfCreated(Transference? transference) {
    if (transference != null)
    setState(() {
      widget.transferenceList.add(transference);
    });
  }
}
