import 'package:flutter/material.dart';

class ConfirmAlert extends StatelessWidget {
  final String title;
  final String contents;
  final VoidCallback? onConfirm;

  const ConfirmAlert({
    super.key,
    required this.title,
    required this.contents,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contents),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm?.call();
          },
          child: Text('확인'),
        ),
      ],
    );
  }
}
