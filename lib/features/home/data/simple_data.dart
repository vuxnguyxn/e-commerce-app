// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  String title;
  IconData icon;
  Category({
    required this.title,
    required this.icon,
  });
}

List dataCategory = [
  Category(title: 'Clothes', icon: Icons.shopping_bag_outlined),
  Category(title: 'Shoes', icon: Icons.shopping_bag_outlined),
  Category(title: 'Bags', icon: Icons.shopping_bag_outlined),
  Category(title: 'Electronics', icon: Icons.shopping_bag_outlined),
  Category(title: 'Watch', icon: Icons.shopping_bag_outlined),
  Category(title: 'Jewelry', icon: Icons.shopping_bag_outlined),
  Category(title: 'Kitchen', icon: Icons.shopping_bag_outlined),
  Category(title: 'Toys', icon: Icons.shopping_bag_outlined),
];

class DataTitleMostPopular {
  String title;
  bool? isSelected;
  DataTitleMostPopular({
    required this.title,
    this.isSelected = false,
  });
}

List dataTitleMostPopular = [
  DataTitleMostPopular(title: 'All', isSelected: false),
  DataTitleMostPopular(title: 'Clothes', isSelected: true),
  DataTitleMostPopular(title: 'T-Shirt', isSelected: false),
  DataTitleMostPopular(title: 'Hat', isSelected: false),
  DataTitleMostPopular(title: 'Hoodie', isSelected: false),
  DataTitleMostPopular(title: 'Legging', isSelected: false),
  DataTitleMostPopular(title: 'Sweater', isSelected: false),
];

List dataPriceRange = [
  DataTitleMostPopular(title: 'All', isSelected: false),
  DataTitleMostPopular(title: '<10\$', isSelected: false),
  DataTitleMostPopular(title: '10 - 20\$', isSelected: true),
  DataTitleMostPopular(title: '20 - 30\$', isSelected: false),
  DataTitleMostPopular(title: '30 - 40\$', isSelected: false),
  DataTitleMostPopular(title: '50 - 100\$', isSelected: false),
  DataTitleMostPopular(title: '>100\$', isSelected: false),
];

List dataSortBy = [
  DataTitleMostPopular(title: 'All', isSelected: false),
  DataTitleMostPopular(title: 'Popular', isSelected: false),
  DataTitleMostPopular(title: 'Most Recent', isSelected: true),
  DataTitleMostPopular(title: 'Price High', isSelected: false),
  DataTitleMostPopular(title: 'Discount', isSelected: false),
  DataTitleMostPopular(title: 'Trending', isSelected: false),
];

List dataRating = [
  DataTitleMostPopular(title: 'All', isSelected: false),
  DataTitleMostPopular(title: '5*', isSelected: false),
  DataTitleMostPopular(title: '4*', isSelected: true),
  DataTitleMostPopular(title: '3*', isSelected: false),
  DataTitleMostPopular(title: '2*', isSelected: false),
  DataTitleMostPopular(title: '1*', isSelected: false),
];

class DataItemMostPopular {
  String image;
  String title;
  int sold;
  double star;
  bool? isFavorites;
  int price;

  DataItemMostPopular({
    required this.image,
    required this.title,
    required this.sold,
    required this.star,
    this.isFavorites = false,
    required this.price,
  });
}

List dataItemMostPopular = [
  DataItemMostPopular(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_2.png',
      title: 'Eagle Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_3.png',
      title: 'Crocodile Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_4.png',
      title: 'Bears Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_5.png',
      title: 'Tiger Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_6.png',
      title: 'Wolf Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
];
List dataItemFavorites = [
  DataItemMostPopular(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      isFavorites: true,
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_2.png',
      title: 'Eagle Leather Bag',
      sold: 1000,
      isFavorites: true,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_3.png',
      title: 'Crocodile Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorites: true,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_4.png',
      title: 'Bears Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorites: true,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_5.png',
      title: 'Tiger Leather Bag',
      sold: 1000,
      isFavorites: true,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_6.png',
      title: 'Wolf Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorites: true,
      price: 650),
];

class Notification {
  String title;
  String content;
  String image;
  Notification({
    required this.title,
    required this.content,
    required this.image,
  });
}

class Notifications {
  String date;
  List<Notification> notifications;
  Notifications({
    required this.date,
    required this.notifications,
  });
}

List dataNotifications = [
  Notifications(
    date: "Today",
    notifications: [
      Notification(
          title: "30% Special Discount!",
          content: "Special promotion only valid today.",
          image: "discount"),
    ],
  ),
  Notifications(
    date: "Yesterday",
    notifications: [
      Notification(
          title: "Top Up E-Wallet Successful!",
          content: "You have to top up your e-wallet",
          image: "wallet"),
      Notification(
          title: "New Service Available!",
          content: "Now you can track orders is real time",
          image: "location"),
    ],
  ),
  Notifications(
    date: "December 22, 2023",
    notifications: [
      Notification(
          title: "Credit Card Connected!",
          content: "Credit Card has been linked!",
          image: "credit"),
      Notification(
          title: "Account Setup Successful!",
          content: "Your account has been created!",
          image: "account"),
    ],
  ),
];

List historySearch = [
  'Snack Skin Bag',
  'Casual Shirt',
  'Black Nike Shoes',
  'HeadPhone Whites',
  'Nikon Camera',
  'Silver Watch',
  'Snack Skin Bag',
  'Casual Shirt',
  'Black Nike Shoes',
  'HeadPhone Whites',
  'Nikon Camera',
  'Silver Watch'
];

class Size {
  String size;
  bool isSelected;
  Size({
    required this.size,
    required this.isSelected,
  });
}

List dataLetterSize = [
  Size(size: "X", isSelected: false),
  Size(size: "M", isSelected: false),
  Size(size: "L", isSelected: false),
  Size(size: "XL", isSelected: true),
  Size(size: "2XL", isSelected: false),
  Size(size: "3XL", isSelected: false),
];
List dataNumberSize = [
  Size(size: "37", isSelected: false),
  Size(size: "38", isSelected: false),
  Size(size: "39", isSelected: false),
  Size(size: "40", isSelected: true),
  Size(size: "41", isSelected: false),
  Size(size: "42", isSelected: false),
];

class ChooseColor {
  Color color;
  bool isSelected;
  ChooseColor({
    required this.color,
    required this.isSelected,
  });
}

List dataChooseColor = [
  ChooseColor(color: Colors.green, isSelected: false),
  ChooseColor(color: Colors.blue, isSelected: true),
  ChooseColor(color: Colors.yellowAccent, isSelected: false),
  ChooseColor(color: Colors.grey, isSelected: false),
  ChooseColor(color: Colors.pinkAccent, isSelected: false),
];
