import 'package:ecomerce/model/Restaurant_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Restaurants> list = [];
  List<Restaurants> list2 = [];
  List<Restaurants> get getCarts => list;

  addCart(Restaurants restaurants) {
    // ignore: prefer_function_declarations_over_variables
    Function handleProduct = () {
      bool isThere = false;
      list.forEach((product) {
        if (product.code == restaurants.code) {
          restaurants.qty = restaurants.qty + 1;
          isThere = true;
          return;
        }
      });
      return isThere;
    };

    if (!handleProduct()) {
      print("first add" + restaurants.qty.toString());
      restaurants.qty = restaurants.qty + 1;
      list.add(restaurants);
    }

    notifyListeners();
  }

  getList() {
    notifyListeners();
    return list;
  }

  removeItem() {
    list.clear();
    notifyListeners();
  }
}
