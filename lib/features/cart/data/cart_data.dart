// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DeliveryShipping {
  String title;
  String content;
  int price;
  bool isSelected;
  DeliveryShipping({
    required this.title,
    required this.content,
    required this.price,
    this.isSelected = false,
  });
}

List dataChooseShippingAddress = [
  DeliveryShipping(
      price: 15,
      title: 'Economy',
      content: 'Estimated Arrival. Dec 20-23',
      isSelected: true),
  DeliveryShipping(
      price: 20,
      title: 'Regular',
      content: 'Estimated Arrival. Dec 20-23',
      isSelected: false),
  DeliveryShipping(
      price: 25,
      title: 'Cargo',
      content: 'Estimated Arrival. Dec 20-23',
      isSelected: false),
  DeliveryShipping(
      price: 30,
      title: "Express",
      content: 'Estimated Arrival. Dec 20-23',
      isSelected: false),
];

class DeliveryAddress {
  String title;
  String content;
  bool isSelected;
  DeliveryAddress({
    required this.title,
    required this.content,
    this.isSelected = false,
  });
}

List dataShippingAddress = [
  DeliveryAddress(
      title: 'Home', content: '640/4 Paris, French', isSelected: true),
  DeliveryAddress(
      title: 'Office', content: '640/5 Hanoi, VietNam', isSelected: false),
  DeliveryAddress(
      title: 'Apartment',
      content: '640/6 Los Angeles, American',
      isSelected: false),
  DeliveryAddress(
      title: "Parent's House",
      content: '640/7 London, England',
      isSelected: false),
];

List dataPromoCode = ['Discount 30% Off', 'Free Shipping', 'Discount 10% ATM'];

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
