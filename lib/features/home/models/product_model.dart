// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String id;
  String title;
  String image;
  int sold;
  double star;
  int price;
  bool isFavorites;

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.sold,
      required this.star,
      required this.isFavorites,
      required this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'sold': sold,
      'star': star,
      'favorite' : isFavorites,
      'price': price,
    };
  }

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      sold: map['sold'] as int,
      star: map['star'] as double,
      isFavorites: map['favorite'] as bool,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
