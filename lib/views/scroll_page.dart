import 'package:flutter/material.dart';
import 'package:flutter_app/models/book.dart';
import 'package:flutter_app/repositories/book_repository.dart';
import 'package:flutter_app/services/book_api_service.dart';
import 'package:flutter_app/views/detail_page.dart';
import 'package:flutter_app/widgets/book_item.dart';
import 'package:flutter_app/widgets/common/warning_modal.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _keywordController = TextEditingController();
  List<String> items = [];
  List<Book> books = [];
  bool hasSearched = false;
  String keyword = "";
  final repository = BookRepository(BookApiService());

  int page = 1;
  final int size = 50;
  bool isLoading = false;
  bool hasMore = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openWarningModal() {
    showDialog(
      context: context,
      builder: (context) {
        return WarningModal(
          title: '경고',
          contents: '책 제목을 입력해주세요',
          onConfirm: () {
            Navigator.pop(context); // 부모가 닫음
          },
        );
      },
    );
  }

  void _loadNextIfScreenNotFull() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_controller.hasClients) return;
      if (isLoading || !hasMore) return;

      final position = _controller.position;
      if (position.maxScrollExtent <= 0) {
        loadBooks();
      }
    });
  }

  void _onScroll() {
    // 맨 아래 도달 감지
    if (_controller.position.pixels >= _controller.position.maxScrollExtent &&
        hasMore &&
        !isLoading) {
      loadBooks();
    }
  }

  Future<void> loadBooks() async {
    if (keyword.isEmpty) return;
    isLoading = true;
    hasMore = true;
    final result = await repository.search(keyword, page: page, size: size);
    setState(() {
      books.addAll(result);

      if (result.length < size) {
        hasMore = false;
      } else {
        page++;
      }
    });
    isLoading = false;
    _loadNextIfScreenNotFull();
  }

  @override
  Widget build(Object context) {
    return SafeArea(
      child: Column(
        children: [
          //검색창
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _keywordController,
              decoration: InputDecoration(
                hintText: '책검색',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  hasSearched = true;
                });

                if (value.trim().isEmpty) {
                  _openWarningModal();
                  return;
                }
                setState(() {
                  keyword = value;
                  page = 1;
                  books.clear();
                });

                loadBooks();
              },
            ),
          ),

          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : !hasSearched
                ? const Center(child: Text('검색해 보세요'))
                : books.isEmpty
                ? const Center(child: Text('정보가 없어요'))
                : ListView.builder(
                    controller: _controller,
                    itemCount: books.length + (hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= books.length && hasMore) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final book = books[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(book: book),
                            ),
                          );
                        },
                        child: BookItem(book: book),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
