import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/network/api_client.dart';

class BookApiService {
  Future<dynamic> searchBooks(
    String query, {
    int page = 1,
    int size = 10,
  }) async {
    final response = await ApiClient.dio.get(
      "/api/books",
      queryParameters: {'query': query, 'page': page, 'size': size},
    );
    final Map<String, dynamic> data = response.data as Map<String, dynamic>;

    final List<dynamic> items = data['item'] as List<dynamic>? ?? [];

    return items.map((e) => Book.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Book> detailBook(int itemId) async {
    final response = await ApiClient.dio.get("/api/books/$itemId");

    final Map<String, dynamic> data = response.data as Map<String, dynamic>;
    final List<dynamic> items = data['item'] as List<dynamic>? ?? [];
    return Book.fromJson(items.first as Map<String, dynamic>);
  }
}
