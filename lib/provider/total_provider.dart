import 'package:flutter/material.dart';

class TotalProvider with ChangeNotifier {
  int? total;

  int get getTotal => total ?? 0;

  TotalProvider();

  void totalPrice({required int price}) {
    int temp = total ?? 0;
    total = temp + price;
  }
}
