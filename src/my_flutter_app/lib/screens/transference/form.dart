import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/editor.dart';
import 'package:my_flutter_app/components/show_alert.dart';
import 'package:my_flutter_app/models/transference.dart';

// Widget transformado em statefull para evitar bugs com o controlador de TextField.
// Envolver um widget Column com uma scrollview evita bugs na tela horizontal.

class TransferenceForm extends StatefulWidget {
  @override
  _TransferenceFormState createState() => _TransferenceFormState();
}

class _TransferenceFormState extends State<TransferenceForm> {
  final _screenTitle = 'Nova transferência';
  final _amountHintText = '0.00';
  final _amountLabelText = 'Valor';
  final _accountHintText = '0000';
  final _accountLabelText = 'Número da Conta';
  final _confirmButtonText = 'Confirmar';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                hint: _accountHintText,
                label: _accountLabelText,
                icon: Icons.account_balance,
                keyboardType: TextInputType.number,
                controller: _accountController,
              ),
              Editor(
                hint: _amountHintText,
                label: _amountLabelText,
                icon: Icons.monetization_on,
                keyboardType: TextInputType.number,
                controller: _amountController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () => _createTransference(context),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(_confirmButtonText),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void _createTransference(BuildContext context) {
    final account = int.tryParse(_accountController.text);
    final amount = double.tryParse(_amountController.text);
    if (amount == null || account == null) {
      return showAlert(context, title: 'Erro', message: 'Não foi possível parsear valores');
    }
    final transference = Transference(
      account: account,
      amount: amount,
    );
    showAlert(context,
      title: 'Transferencia criada!',
      message: 'Transferência para conta ${transference.account} no valor de ${transference.amount}',
      onDismiss: () {
        Navigator.pop(context, transference);
      },
    );
  }
}
