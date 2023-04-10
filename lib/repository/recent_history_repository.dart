import 'package:e_commerce_app/core/storage_manager.dart';
import 'package:flutter/material.dart';

class RecentHistoryRepository with ChangeNotifier {
  List<String>? recentHistory;

  List<String> get getList => recentHistory ?? [];

  RecentHistoryRepository() {
    StorageManager.readStringListData('recentHistory').then((value) {
      List<String> list = value ?? [];
      recentHistory = list;
      notifyListeners();
    });
  }

  void setData({required List<String> data}) async {
    recentHistory = data;
    StorageManager.savedData('recentHistory', data);
    notifyListeners();
  }
}
