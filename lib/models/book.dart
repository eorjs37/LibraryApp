class Book {
  final String title;
  final String author;
  final String publisher;
  final String cover;
  final String isbn13;

  Book({
    required this.title,
    required this.author,
    required this.publisher,
    required this.cover,
    required this.isbn13,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      publisher: json['publisher'] ?? '',
      cover: json['cover'] ?? '',
      isbn13: json['isbn13'] ?? '',
    );
  }
}
