import 'package:flutter/material.dart';

class ItemList extends ChangeNotifier {
  final List<List<dynamic>> _items = [
    [
      0,
      "Pulpen",
      "Boldliner",
      "",
      "",
      100,
      "assets/boldliner.jpg",
    ],
    [
      1,
      "Kertas A4",
      "Bola Dunia",
      "",
      "",
      100,
      "assets/bola_dunia.jpg",
    ],
    [
      2,
      "Kertas F4",
      "Bola Dunia",
      "",
      "",
      100,
      "assets/bola_dunia2.jpg",
    ],
    [
      3,
      "Kertas F4",
      "Bola Dunia",
      "",
      "",
      100,
      "assets/logo.jpg",
    ]
  ];

  List get items => _items;
  int get id => _items.length;

  int isItemList(List<dynamic> addItem) {
    for (int index = 0; index < _items.length; index++) {
      var item = _items[index];
      if (item[0] == addItem[0] && item[1] == addItem[1]) {
        return index;
      }
    }
    return -1;
  }

  void setQty({
    required int index,
    required int qty,
  }) {
    try {
      _items[index][5] = qty;
      debugPrint(_items[index].toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> addItem({
    required String itemName,
    required String itemBrand,
    required String itemType,
    required String itemDesc,
    required int itemQty,
    required dynamic itemImg,
  }) async {
    List<dynamic> newItem = [
      id,
      itemName,
      itemBrand,
      itemType,
      itemDesc,
      itemQty,
      itemImg,
    ];
    try {
      int existingIndex = isItemList(newItem);
      if (existingIndex == -1) {
        _items.add(newItem);
        debugPrint(_items.toString());
      } else {
        // If the item exists, update its quantity by adding 100
        _items[existingIndex][5] += itemQty;
        debugPrint('Quantity updated for item at index $existingIndex');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
