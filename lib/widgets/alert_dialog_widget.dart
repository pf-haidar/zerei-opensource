import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      title: Text(title),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancelar',
            style: TextStyle(color: Theme.of(context).canvasColor),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Sim',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
