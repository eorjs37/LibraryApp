import 'package:flutter/material.dart';

class MyLibraryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(appBar: AppBar(title: Text("나의 서재"))));
  }
}
