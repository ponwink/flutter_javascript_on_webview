import 'package:flutter/material.dart';

class AlertFlutter {
  /// アラート表示
  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialogWidget(),
    );
  }
}

/// アラートダイアログ
class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Hello, flutter!'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('close'),
        ),
      ],
    );
  }
}
