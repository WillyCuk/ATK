import 'package:flutter/material.dart';
import "dart:math";

class User extends ChangeNotifier {
  String _user = 'username';
  String _email = 'user@gmail.com';
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
      "email": "willyhalim5@gmail.com",
      'password': 'haiyahai',
      'role': 'user'
    },
    {
      'username': 'jason',
      "email": "willyhalim43@gmail.com",
      'password': 'haiyahaiya',
      'role': 'user'
    }
  ];

  String get user => _user;
  String get email => _email;
  String get role => _role;
  bool get isLogin => _isLogin;

  set isLogin(val) {
    _isLogin = val;
  }

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
        _email = email;
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

  requestOTP(String userEmail) {
    try {
      bool isEmailValid = _userList.any((email) => email['email'] == userEmail);
      if (isEmailValid) {
        var random = Random();
        int randomNumber = 1000 + random.nextInt(9000);
        return randomNumber;
      } else {
        throw "Invalid Email";
      }
    } catch (e) {
      rethrow;
    }
  }

  changePass(String userEmail, String newPass) {
    int userIndex =
        _userList.indexWhere((email) => email['email'] == userEmail);
    _userList[userIndex]['password'] = newPass;
    debugPrint("list of email : ${_userList.toString()}");
  }
}
