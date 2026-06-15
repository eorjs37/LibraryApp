import 'package:flutter/material.dart';

class WarningModal extends StatelessWidget {
  final String title;
  final String contents;
  final VoidCallback onConfirm;

  const WarningModal({
    super.key,
    required this.title,
    required this.contents,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contents),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actions: [
        ElevatedButton(
          onPressed: () {
            onConfirm();
          },
          child: const Text('확인'),
        ),
      ],
    );
  }
}
