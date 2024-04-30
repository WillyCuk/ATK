import 'package:flutter/material.dart';

class UserOrder extends ChangeNotifier {
  final List<Map<String, dynamic>> _userOrderList = [
    {
      "user": "username",
      "order": {
        "id": 1,
        "status": "Waiting",
        "date": '23 April 2021',
        "items": [
          {"id": 2, "qty": 21},
          {"id": 0, "qty": 123}
        ]
      }
    },
    {
      "user": "anying",
      "order": {
        "id": 2,
        "status": "Approved",
        "date": '24 Mei 2022',
        "items": [
          {"id": 2, "qty": 21},
        ]
      }
    },
    {
      "user": "anying",
      "order": {
        "id": 3,
        "status": "Waiting",
        "date": '23 Juni 2023',
        "items": [
          {"id": 2, "qty": 21},
        ]
      }
    },
    {
      "user": "anying",
      "order": {
        "id": 3,
        "status": "Waiting",
        "date": '23 Juni 2023',
        "items": [
          {"id": 2, "qty": 21},
        ]
      }
    },
    {
      "user": "anying",
      "order": {
        "id": 4,
        "status": "Approved",
        "date": '23 April 2024',
        "items": [
          {"id": 2, "qty": 21},
        ]
      }
    },
  ];

  List<Map<String, dynamic>> get userOrderList => _userOrderList;
  int get id => _userOrderList.length;

  void addOrder(
      {required String user, required List itemRequest, required String date}) {
    _userOrderList.add({
      "user": user,
      "order": [
        {"id": id + 1, "status": "Waiting", "date": date, "items": itemRequest}
      ]
    });
    debugPrint(_userOrderList.toString());
    notifyListeners();
  }

  void changeStatusApproved({required int index}) {
    int orderIndex =
        _userOrderList.indexWhere((element) => element["order"]['id'] == index);
    _userOrderList[orderIndex]["order"]["status"] = "Approved";
    notifyListeners();
  }

  void changeStatusRejected({required int index, required String message}) {
    int orderIndex =
        _userOrderList.indexWhere((element) => element["order"]['id'] == index);
    _userOrderList[orderIndex]["order"]["message"] = message;
    _userOrderList[orderIndex]["order"]["status"] = "Rejected";
    notifyListeners();
  }
}
