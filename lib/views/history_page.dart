import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "기록",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: "메모"),
                  Tab(text: "통계"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("첫 번째 화면")),
                    Center(child: Text("두 번째 화면")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
