// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Order {
  final String image;
  final String title;
  final String status;
  final Color color;
  final String size;
  final int quantity;
  final int price;
  final List<DetailStatus> detailStatus;
  Order({
    required this.detailStatus,
    required this.image,
    required this.title,
    required this.status,
    required this.color,
    required this.size,
    required this.quantity,
    required this.price,
  });
}

class DetailStatus {
  final String title;
  final String dayOfMonth;
  final String time;
  final String content;
  DetailStatus({
    required this.title,
    required this.dayOfMonth,
    required this.time,
    required this.content,
  });
}

List dataOrder = [
  Order(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      status: 'In Delivery',
      color: Colors.orange,
      detailStatus: [
        DetailStatus(
            title: 'Order int Transit',
            dayOfMonth: 'Dec 15',
            time: '12:02 PM',
            content: '32 Manchester Ave, RingGold, GA 30888!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 14',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 13',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 14',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 13',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 14',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 13',
            time: '12:02 PM',
            content: 'Order successful!'),
      ],
      size: 'M',
      quantity: 2,
      price: 700),
  Order(
      image: 'assets/images/bag_2.png',
      title: 'Snake Leather Bag',
      status: 'In Delivery',
      color: Colors.red,
      size: 'M',
      detailStatus: [
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 12',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 12',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 12',
            time: '12:02 PM',
            content: 'Order successful!'),
      ],
      quantity: 3,
      price: 800),
  Order(
      image: 'assets/images/bag_3.png',
      title: 'Snake Leather Bag',
      status: 'In Delivery',
      color: Colors.blue,
      detailStatus: [
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 12',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 12',
            time: '12:02 PM',
            content: 'Order successful!'),
        DetailStatus(
            title: 'Order',
            dayOfMonth: 'Dec 12',
            time: '12:02 PM',
            content: 'Order successful!'),
      ],
      size: 'M',
      quantity: 4,
      price: 900),
];
