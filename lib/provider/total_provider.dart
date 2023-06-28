import 'package:flutter/material.dart';

class TotalProvider with ChangeNotifier {
  int total = 0;
  int totalAll = 0;

  int get getTotal => total;
  int get getTotalAll => totalAll;

  TotalProvider();

  void totalPrice({required int price}){
    total = total + price;
    notifyListeners();
  }

  void totalAllPrice({required int price}){
    totalAll = totalAll + price;
    notifyListeners();
  }


  void reset() {
    total = 0;
    notifyListeners();
  }
}
