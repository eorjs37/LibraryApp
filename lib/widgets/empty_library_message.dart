import 'package:flutter/material.dart';

class EmptyLibraryMessage extends StatelessWidget {
  final String message;

  const EmptyLibraryMessage({
    Key? key,
    this.message = "텅빈 빈 서재에요😢\n로그인 후, 책을 검색 -> 추가해 주세요!\n서재가 가득 찰거에요!!📖🥳📖",
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
