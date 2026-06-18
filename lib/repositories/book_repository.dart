import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/services/book_api_service.dart';

class BookRepository {
  final BookApiService api;

  BookRepository(this.api);

  Future<List<Book>> search(
    String keyword, {
    int page = 1,
    int size = 10,
  }) async {
    final result = await api.searchBooks(keyword, page: page, size: size);

    return result;
  }

  Future<Book> detail(int itemId) async {
    final result = await api.detailBook(itemId);
    return result;
  }
}
