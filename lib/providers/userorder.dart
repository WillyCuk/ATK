import 'package:flutter/material.dart';

class UserOrder extends ChangeNotifier {
  final List<Map<String, dynamic>> _userOrderList = [
    {"user": "willy", "order": <int>[]}
  ];

  List get userOrderList => _userOrderList;
  int id = 1;

  void addOrder({required String user, required List itemRequest}) {
    bool userExists = _userOrderList.any((order) => order['user'] == user);

    if (userExists) {
      int userIndex =
          _userOrderList.indexWhere((order) => order['user'] == user);
      _userOrderList[userIndex]['order'].add({"id": id, "items": itemRequest});
      id++;
    } else {
      _userOrderList.add({
        "user": user,
        "order": [
          {"id": id, "items": itemRequest}
        ]
      });
    }
    id++;
    debugPrint(_userOrderList.toString());
    notifyListeners();
  }
}
