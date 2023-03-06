// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Order {
  String image;
  String title;
  String status;
  Color color;
  String size;
  int quantity;
  int price;
  Order({
    required this.image,
    required this.title,
    required this.status,
    required this.color,
    required this.size,
    required this.quantity,
    required this.price,
  });
}

List dataOrder = [
  Order(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      status: 'In Delivery',
      color: Colors.orange,
      size: 'M',
      quantity: 2,
      price: 800),
  Order(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      status: 'In Delivery',
      color: Colors.orange,
      size: 'M',
      quantity: 2,
      price: 800),
  Order(
      image: 'assets/images/bag_1.png',
     title: 'Snake Leather Bag',
      status: 'In Delivery',
      color: Colors.orange,
      size: 'M',
      quantity: 2,
      price: 800),
];
