class Book {
  final int itemId;
  final String title;
  final String author;
  final String publisher;
  final String cover;
  final String isbn13;
  final String description;

  Book({
    required this.itemId,
    required this.title,
    required this.author,
    required this.publisher,
    required this.cover,
    required this.isbn13,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      itemId: json['itemId'] ?? -1,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      publisher: json['publisher'] ?? '',
      cover: json['cover'] ?? '',
      isbn13: json['isbn13'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
