import 'package:atk/providers/itemlist.dart';
import 'package:atk/providers/user.dart';
import 'package:atk/providers/userorder.dart';
import 'package:atk/router/router.dart';
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
          ChangeNotifierProvider(create: (context) => ItemList()),
          ChangeNotifierProvider(create: (context) => UserOrder()),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent),
          debugShowCheckedModeBanner: false,
          routerConfig: MyRouter().router,
        ));
  }
}
