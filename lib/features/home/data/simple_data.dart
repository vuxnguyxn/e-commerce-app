// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  String id;
  String title;
  String svgLight;
  String svgDark;
  Category({
    required this.id,
    required this.title,
    required this.svgLight,
    required this.svgDark,
  });
}

List dataCategory = [
  Category(
      title: 'Bags',
      svgLight: 'assets/icons/bag_light.svg',
      id: 'product_bags',
      svgDark: 'assets/icons/bag_dark.svg'),
  Category(
      title: 'Clothes',
      svgLight: 'assets/icons/clothes_light.svg',
      id: 'product_clothes',
      svgDark: 'assets/icons/clothes_dark.svg'),
  Category(
      title: 'Shoes',
      svgLight: 'assets/icons/shoes_light.svg',
      id: 'product_shoes',
      svgDark: 'assets/icons/shoes_dark.svg'),
  Category(
      title: 'Headphones',
      svgLight: 'assets/icons/headphones_light.svg',
      id: 'product_headphones',
      svgDark: 'assets/icons/headphones_dark.svg'),
  Category(
      title: 'Gloves',
      svgLight: 'assets/icons/glove_light.svg',
      id: 'product_gloves',
      svgDark: 'assets/icons/glove_dark.svg'),
  Category(
      title: 'Gamings',
      svgLight: 'assets/icons/gaming_light.svg',
      id: 'product_gaming',
      svgDark: 'assets/icons/gaming_dark.svg'),
  Category(
      title: 'Books',
      svgLight: 'assets/icons/book_light.svg',
      id: 'product_books',
      svgDark: 'assets/icons/book_dark.svg'),
  Category(
      title: 'Helmets',
      svgLight: 'assets/icons/helmet_light.svg',
      id: 'product_helmets',
      svgDark: 'assets/icons/helmet_dark.svg'),
];
class DataTabBar {
  String title;
  String id;
  DataTabBar({
    required this.title,
    required this.id,
  });
}

List dataTitleMostPopular = [
  DataTabBar(title: 'All', id: "all"),
  DataTabBar(title: 'Bags', id: "bags"),
  DataTabBar(title: 'Shoes', id: "shoes"),
  DataTabBar(title: 'Gloves', id: "gloves"),
  DataTabBar(title: 'Books', id: "books"),
  DataTabBar(title: 'Clothes', id: "clothes"),
  DataTabBar(title: 'Headphones', id: "headphones"),
  DataTabBar(title: 'Gaming', id: "gaming"),
  DataTabBar(title: 'Helmets', id: "helmets"),
];

List dataPriceRange = [
  DataTabBar(title: 'All', id: "all"),
  DataTabBar(title: '<10\$', id: "10"),
  DataTabBar(title: '10 - 20\$', id: "10-20"),
  DataTabBar(title: '20 - 30\$', id: "20-30"),
  DataTabBar(title: '30 - 40\$', id: "30-40"),
  DataTabBar(title: '50 - 100\$', id: "50-100"),
  DataTabBar(title: '>100\$', id: "100"),
];

List dataSortBy = [
  DataTabBar(title: 'All', id: "all"),
  DataTabBar(title: 'Popular', id: "popular"),
  DataTabBar(title: 'Most Recent', id: "most_recent"),
  DataTabBar(title: 'Price High', id: "price_high"),
  DataTabBar(title: 'Discount', id: "discount"),
  DataTabBar(title: 'Trending', id: "trending"),
];

List dataRating = [
  DataTabBar(title: 'All', id: "all"),
  DataTabBar(title: '5*', id: "5"),
  DataTabBar(title: '4*', id: "4"),
  DataTabBar(title: '3*', id: "3"),
  DataTabBar(title: '2*', id: "2"),
  DataTabBar(title: '1*', id: "1"),
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
    date: 'Today',
    notifications: [
      Notification(
          title: '30% Special Discount!',
          content: 'Special promotion only valid today.',
          image: 'discount'),
    ],
  ),
  Notifications(
    date: 'Yesterday',
    notifications: [
      Notification(
          title: 'Top Up E-Wallet Successful!',
          content: 'You have to top up your e-wallet',
          image: 'wallet'),
      Notification(
          title: 'New Service Available!',
          content: 'Now you can track orders is real time',
          image: 'location'),
    ],
  ),
  Notifications(
    date: 'December 22, 2023',
    notifications: [
      Notification(
          title: 'Credit Card Connected!',
          content: 'Credit Card has been linked!',
          image: 'credit'),
      Notification(
          title: 'Account Setup Successful!',
          content: 'Your account has been created!',
          image: 'account'),
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
  Size(size: 'X', isSelected: false),
  Size(size: 'M', isSelected: false),
  Size(size: 'L', isSelected: false),
  Size(size: 'XL', isSelected: true),
  Size(size: '2XL', isSelected: false),
  Size(size: '3XL', isSelected: false),
];
List dataNumberSize = [
  Size(size: '37', isSelected: false),
  Size(size: '38', isSelected: false),
  Size(size: '39', isSelected: false),
  Size(size: '40', isSelected: true),
  Size(size: '41', isSelected: false),
  Size(size: '42', isSelected: false),
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
