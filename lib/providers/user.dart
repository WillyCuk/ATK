import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _user;
  String _role;
  bool _isLogin;
  final List<Map<String, String>> _userList;

  User({
    String user = 'username',
    String role = 'user',
    bool isLogin = false,
    List<Map<String, String>> userList = const [
      {'user': 'willy', 'password': 'mantap', 'role': 'admin'}
    ],
  })  : _user = user,
        _role = role,
        _userList = userList,
        _isLogin = isLogin;

  String get user => _user;
  String get role => _role;
  bool get isLogin => _isLogin;

  bool isValidCredentials(String user, String pwd) {
    for (var userInfo in _userList) {
      if (userInfo['user'] == user && userInfo['password'] == pwd) {
        _role = userInfo['role']!;
        return true;
      }
    }
    return false;
  }

  Future<void> login({
    required String user,
    required String pwd,
  }) async {
    try {
      if (isValidCredentials(user, pwd)) {
        _user = user;
        _isLogin = true;
        notifyListeners();
      } else {
        _isLogin = false;
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
