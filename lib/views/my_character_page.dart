import 'package:flutter/material.dart';

class MyCharacterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCharacterPageState();
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(appBar: AppBar(title: Text("나의 캐릭터"))));
  }
}
