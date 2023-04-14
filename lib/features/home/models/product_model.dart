// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String id;
  String title;
  List listImage;
  List size;
  List color;
  String description;
  int sold;
  double star;
  int price;
  int reviews;
  bool isFavorites;

  Product({
    required this.id,
    required this.title,
    required this.listImage,
    required this.size,
    required this.color,
    required this.description,
    required this.sold,
    required this.star,
    required this.price,
    required this.reviews,
    required this.isFavorites,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'listImage': listImage,
      'size': size,
      'color': color,
      'description': description,
      'sold': sold,
      'star': star,
      'price': price,
      'reviews': reviews,
      'isFavorites': isFavorites,
    };
  }

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      listImage: List.from((map['list-image'] ?? [])),
      size: List.from((map['size'] ?? [])),
      color: List.from((map['color'] ?? [])),
      description: map['description'] ?? '',
      sold: map['sold'] ?? 0,
      star: map['star'] ?? 0,
      price: map['price'] ?? 0,
      reviews: map['reviews'] ?? 0,
      isFavorites: map['isFavorites'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
}
