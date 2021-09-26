
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransferenceList(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.yellow[600],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[900]),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green[900],
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class TransferenceList extends StatefulWidget {
  final transferenceList = <Transference>[
    Transference(amount: 123, account: 123),
  ];

  @override
  State<TransferenceList> createState() {
    return _TransferenceListState();
  }
}

class _TransferenceListState extends State<TransferenceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      // Column não é adequado para renderizar listas de items, usamos ListView.
      // ListView não é usado para listas dinâmicas, nesse caso usamos ListView.builder.
      body: ListView.builder(
        itemCount: widget.transferenceList.length,
        itemBuilder: (context, index) {
          return TransferenceItem(transference: widget.transferenceList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransferenceForm(context),
      ),
    );
  }

  void _openTransferenceForm(BuildContext context) async {
    final transference = await Navigator.push<Transference>(
      context,
      MaterialPageRoute(
        builder: (context) => TransferenceForm(),
      ),
    );
    if (transference == null) return;
    setState(() {
      widget.transferenceList.add(transference);
    });
  }
}

class TransferenceItem extends StatelessWidget {
  final Transference transference;

  TransferenceItem({ required this.transference });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('${transference.amount}'),
        subtitle: Text('${transference.account}'),
      ),
    );
  }
}

class TransferenceForm extends StatefulWidget {
  // Widget transformado em statefull para evitar bugs com o controlador de TextField.
  @override
  _TransferenceFormState createState() => _TransferenceFormState();
}

class _TransferenceFormState extends State<TransferenceForm> {
  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transferência'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        // Envolver um widget Column com uma scrollview evita bugs na tela horizontal.
        child: SingleChildScrollView(
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
        prefixIcon: icon != null
          ? Icon(
            icon,
            color: Theme.of(context).primaryColor,
          )
          : null,
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}

void showAlert(BuildContext context, { String? title, String message = '', String buttonText = 'OK', Function? onDismiss }) {
  debugPrint(message);
  showDialog(context: context, barrierDismissible: false, builder: (context) {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(message),
      actions: [
        ElevatedButton(
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
            if (onDismiss != null) onDismiss();
          },
        ),
      ],
    );
  });
}
