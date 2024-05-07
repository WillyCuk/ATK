import 'package:atk/providers/itemlist.dart';
import 'package:atk/providers/theme.dart';
import 'package:atk/providers/user.dart';
import 'package:atk/providers/userorder.dart';
import 'package:atk/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => User()),
    ChangeNotifierProvider(create: (context) => ItemList()),
    ChangeNotifierProvider(create: (context) => UserOrder()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: MyRouter().router,
    );
  }
}
