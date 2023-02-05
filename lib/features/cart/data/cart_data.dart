// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Cart {
  String name;
  String image;
  String size;
  Color color;
  int price;
  int quantity;
  Cart({
    required this.name,
    required this.image,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
  });
}

List dataCart = [
  Cart(
      name: "Snake Leather Bag",
      image: "assets/images/bag_1.png",
      size: "M",
      color: Colors.amber,
      price: 800,
      quantity: 2),
  Cart(
      name: "Snake Leather Bag",
      image: "assets/images/bag_2.png",
      size: "M",
      color: Colors.pink,
      price: 800,
      quantity: 2),
  Cart(
      name: "Snake Leather Bag",
      image: "assets/images/bag_3.png",
      size: "M",
      color: Colors.red,
      price: 800,
      quantity: 2),
  Cart(
      name: "Snake Leather Bag",
      image: "assets/images/bag_4.png",
      size: "M",
      color: Colors.green,
      price: 800,
      quantity: 4),
  Cart(
      name: "Snake Leather Bag",
      image: "assets/images/bag_5.png",
      size: "M",
      color: Colors.grey,
      price: 800,
      quantity: 5),
];
