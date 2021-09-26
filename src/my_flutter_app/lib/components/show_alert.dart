import 'package:flutter/material.dart';

void showAlert(BuildContext context, {
  String? title,
  String message = '',
  String buttonText = 'OK',
  Function? onDismiss
}) {
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
