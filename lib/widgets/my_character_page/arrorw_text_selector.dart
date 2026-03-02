import 'package:flutter/material.dart';

class ArrorwTextSelector extends StatelessWidget {
  final String text;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  const ArrorwTextSelector({
    super.key,
    required this.text,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(text, style: const TextStyle(fontSize: 18)),

          /// 왼쪽 화살표 (완전 왼쪽)
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: onLeftPressed,
            ),
          ),

          /// 오른쪽 화살표 (완전 오른쪽)
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: onRightPressed,
            ),
          ),
        ],
      ),
    );
  }
}
