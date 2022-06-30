import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  static List list = List.empty(growable: true);

  addCart(int pos) {
    list.add(pos);
    notifyListeners();
  }

  List getList() {
    return list;
  }

  removeItem(index) {
    list.removeAt(index);
  }
}
