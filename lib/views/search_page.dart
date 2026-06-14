import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/book_repository.dart';
import 'package:flutter_app/services/book_api_service.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<SearchPage> {
  final repository = BookRepository(BookApiService());
  @override
  Widget build(BuildContext context) {
    return (Center(child: Text("Search")));
  }

  @override
  void initState() async {
    final result = await repository.search("해리포터");
    // TODO: implement initState
    super.initState();
  }

  Future<void> loadBooks() async {}
}
