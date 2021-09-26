
import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/transference/list.dart';
import 'package:my_flutter_app/theme/default_theme.dart';

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferenceList(),
      debugShowCheckedModeBanner: false,
      theme: defaultTheme(),
    );
  }
}
