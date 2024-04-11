import 'package:flutter/material.dart';

class ItemList extends ChangeNotifier {
  final List<List<dynamic>> _items = [
    ["Pulpen", "Boldliner", 100],
    ["Kertas A4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
    ["Kertas F4", "Bola Dunia", 100],
  ];

  List get items => _items;

  int isItemList(List<dynamic> addItem) {
    for (int index = 0; index < _items.length; index++) {
      var item = _items[index];
      if (item[0] == addItem[0] && item[1] == addItem[1]) {
        return index;
      }
    }
    return -1;
  }

  Future<void> addItem({
    required String itemName,
    required String itemBrand,
    required String itemType,
    required String itemDesc,
    required String itemQty,
  }) async {
    int itemQtys = int.parse(itemQty);
    List<dynamic> newItem = [itemName, itemBrand, itemType, itemDesc, itemQtys];
    try {
      int existingIndex = isItemList(newItem);
      if (existingIndex == -1) {
        _items.add(newItem);
        debugPrint(_items.toString());
      } else {
        // If the item exists, update its quantity by adding 100
        _items[existingIndex][2] += itemQtys;
        debugPrint('Quantity updated for item at index $existingIndex');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
