import 'package:flutter/material.dart';
import '../widgets/empty_library_message.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchText = "";
  String selected = "A"; // 선택 상태: "A" 또는 "B"

  final Color activeColor = Color(0xFF0D6EFD); // Bootstrap primary
  final Color normalColor = Colors.white; // 선택 안된 버튼 배경

  void _showAlert(String value) {
    showDialog(
      context: context, // 👉 State가 가진 context
      builder: (context) {
        return AlertDialog(
          title: Text("책 검색"),
          content: Text("값을 입력해주세요"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
          onSubmitted: (value) {
            if (value.isEmpty) {
              _showAlert(value);
            }
          },
          decoration: InputDecoration(
            hintText: "검색어를 입력해주세요",
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  "2026년 (0)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF000000),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selected = "A"; // 버튼 A 선택
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down, size: 30),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = "A";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selected == "A"
                          ? activeColor
                          : normalColor,
                      foregroundColor: selected == "A"
                          ? Colors.white
                          : Colors.black,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("쌓아보기"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = "B"; // 버튼 B 선택
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selected == "B"
                          ? activeColor
                          : normalColor,
                      foregroundColor: selected == "B"
                          ? Colors.white
                          : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("리스트형 보기"),
                  ),
                ),
              ],
            ),
          ),
          EmptyLibraryMessage(),
        ],
      ),
    );
  }
}
