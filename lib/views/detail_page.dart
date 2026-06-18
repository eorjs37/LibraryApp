import 'package:flutter/material.dart';
import 'package:flutter_app/exception/api_exception.dart';
import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/repositories/book_repository.dart';
import 'package:flutter_app/services/book_api_service.dart';

class DetailPage extends StatefulWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  final repository = BookRepository(BookApiService());
  Book? bookDetail;
  String errorMessage = "";
  @override
  void initState() {
    super.initState();
    fetchBook();
  }

  Future<void> fetchBook() async {
    try {
      final result = await repository.detail(widget.book.itemId);
      setState(() {
        bookDetail = result;
      });
    } on ApiException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    } catch (e) {
      setState(() {
        errorMessage = '알 수 없는 오류가 발생했습니다.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bookDetail?.title ?? '')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookDetail == null
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          bookDetail!.cover,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
              const SizedBox(height: 24),
              Text(
                bookDetail?.title ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                bookDetail?.author ?? '',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),

              const SizedBox(height: 4),

              Text(
                bookDetail?.publisher ?? '',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),

              const SizedBox(height: 32),

              const Text(
                '책 소개',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Text(
                bookDetail?.description ?? '',
                style: const TextStyle(fontSize: 16, height: 1.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
