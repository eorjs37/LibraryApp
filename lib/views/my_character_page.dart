import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCharacterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCharacterPageState();
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/hanger-icon.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag, size: 20),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "나의 캐릭터",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 0,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.grey, // 👈 테두리 색
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.money, size: 20),
                          SizedBox(width: 6),
                          Text(
                            "12",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      right: 2,
                      top: 3,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            // 이미지
            Center(
              child: Image.asset('assets/images/book_ch.png', height: 350),
            ),
          ],
        ),
      ),
    ));
  }
}
