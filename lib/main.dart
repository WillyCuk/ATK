import 'package:atk/pages/login.dart';
import 'package:atk/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (LoginPage()),
      ),
    );
  }
}
