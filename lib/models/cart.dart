import 'package:flutter/material.dart';
import 'package:provider_app/models/item.dart';
import 'package:provider_app/repositories/item_list.dart';
//* 장바구니 앱입니다
//* 장바구니는 페이지를 가더라도 항상 유지가 되어있어야겠죠?
//* 전역상태관리가 필요합니다.
//* 상태가 변화하는 모델이죠? 모델에서 변화된 상태를 Ui에 알려주는 ChangeNotifier가 필요합니다

class Cart extends ChangeNotifier {
  final List<Item> items = [];

  //* items의 변화를 발생시키지 않으므로 notifyListers는 필요 없다
  int getTotalItemPrice(items) {
    int total = 0;
    for (Item item in items) {
      total += item.price;
    }
    return total;
  }

  void addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  void deleteItem(int id) {
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
