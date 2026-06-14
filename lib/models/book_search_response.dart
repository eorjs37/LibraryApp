import 'package:flutter_app/models/book.dart';

class BookSearchResponse {
  final int totalResults;
  final int startIndex;
  final int itemsPerPage;
  final List<Book> items;

  BookSearchResponse({
    required this.totalResults,
    required this.startIndex,
    required this.itemsPerPage,
    required this.items,
  });

  factory BookSearchResponse.fromJson(Map<String, dynamic> json) {
    return BookSearchResponse(
      totalResults: json['totalResults'] ?? 0,
      startIndex: json['startIndex'] ?? 1,
      itemsPerPage: json['itemsPerPage'] ?? 10,
      items: (json['item'] as List<dynamic>? ?? [])
          .map((e) => Book.fromJson(e))
          .toList(),
    );
  }
}
