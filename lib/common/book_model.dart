import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  BookModel({
    required this.name,
    required this.bookImageUrl,
    required this.description,
    required this.price,
    required this.rate,
    required this.pages,
    required this.language,
    required this.totalSales,
    required this.id,
    required this.genre,
    required this.author,
    this.saveMark = false,
    this.qty = 0,
  });

  final String name;
  final String bookImageUrl;
  final String description;
  final double price;
  final double rate;
  final int pages;
  final String language;
  final int totalSales;
  final int id;
  final String genre;
  final String author;
  bool saveMark;
  int qty;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        name: json["name"],
        bookImageUrl: json["bookImageUrl"],
        description: json["description"],
        price: double.parse(json["price"].toString()),
        rate: double.parse(json["rate"].toString()),
        pages: int.parse(json["pages"].toString()),
        language: json["language"],
        totalSales: json["total_sales"],
        id: int.parse(json["id"].toString()),
        genre: json["genre"]['name'],
        author: json["author"]['name'],
        qty: json['qty'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bookImageUrl": bookImageUrl,
        "description": description,
        "price": price,
        "rate": rate,
        "pages": pages,
        "language": language,
        "total_sales": totalSales,
        "id": id,
        "genre": {"name": genre},
        "author": {"name": author},
      };

  @override
  List<Object?> get props => [
        name,
        bookImageUrl,
        description,
        price,
        rate,
        pages,
        language,
        totalSales,
        id,
        genre,
        author,
      ];
}
