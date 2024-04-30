import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _user = '';
  String _role = 'user';
  bool _isLogin = false;
  final List<Map<String, String>> _userList = [
    {
      'username': 'willy',
      "email": "willyhalim543@gmail.com",
      'password': 'mantapkali',
      'role': 'admin'
    },
    {
      'username': 'cecilia',
      "email": "willyhalim543@gmail.com",
      'password': 'haiyahai',
      'role': 'user'
    },
    {
      'username': 'jason',
      "email": "willyhalim543@gmail.com",
      'password': 'haiyahaiya',
      'role': 'user'
    }
  ];

  String get user => _user;
  String get role => _role;
  bool get isLogin => _isLogin;

  void login({
    required String user,
    required String pwd,
  }) {
    try {
      debugPrint(_userList.toString());
      bool isValidUser =
          _userList.any((element) => element['username'] == user);
      bool isValidPass = _userList.any((element) => element['password'] == pwd);
      if (isValidUser && isValidPass) {
        _user = user;
        _isLogin = true;
        int userIndex =
            _userList.indexWhere((element) => element['username'] == user);
        _role = _userList[userIndex]['role']!;
      } else if (!isValidUser) {
        throw Exception('Invalid Username');
      } else if (!isValidPass) {
        throw Exception('Invalid Password');
      }
    } catch (e) {
      rethrow;
    }
  }

  void addUser(
      {required String username,
      required String email,
      required String password}) {
    try {
      bool userExist =
          _userList.any((element) => element['username'] == username);
      if (userExist) {
        throw Exception('Username already exist');
      }
      Map<String, String> user = {
        "username": username,
        "email": email,
        "password": password,
        "role": "user"
      };
      _userList.add(user);
      debugPrint(_userList.toString());
    } catch (e) {
      rethrow;
    }
  }
}
