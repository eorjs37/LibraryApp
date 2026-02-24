import 'package:flutter/material.dart';
import '../widgets/empty_library_message.dart';

class MyLibraryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  String selectedTab = "전체"; // 선택 상태
  final tabs = ["전체", "읽고 있는 책", "읽고 싶은 책", "중단한 책"];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                "나의 서재",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // 1️⃣ 탭 버튼 Row
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tabs.map((tab) {
                bool isActive = selectedTab == tab;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = tab;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: isActive
                          ? Border(
                              bottom: BorderSide(
                                color: Colors.blue, // active 색상
                                width: 3,
                              ),
                            )
                          : null, // active 아니면 border 없음
                    ),
                    child: Text(
                      "$tab 0",
                      style: TextStyle(
                        color: isActive ? Colors.blue : Colors.black87,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16),
          // 2️⃣ 탭 콘텐츠 영역
          Expanded(
            child: Container(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: Text("최신 저장일 순 ↓")),
                      ],
                    ),
                    EmptyLibraryMessage(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
