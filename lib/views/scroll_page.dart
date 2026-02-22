import 'package:flutter/material.dart';
import '../services/fake_api.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final ScrollController _controller = ScrollController();
  List<String> items = [];

  int page = 1;
  final int size = 5;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchData();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        if (!isLoading && hasMore) {
          fetchData();
        }
      }
    });
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final newItems = await fakeApi(page, size);

    if (newItems.isEmpty) {
      hasMore = false;
    } else {
      page++;
      items.addAll(newItems);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(Object context) {
    return (ListView.builder(
      controller: _controller,
      itemCount: items.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return ListTile(title: Text(items[index]));
      },
    ));
  }
}
