import 'package:atk/providers/theme.dart';
import 'package:atk/providers/user.dart';
import 'package:atk/router/routernamed.dart';
import 'package:atk/utils/dashboardtile.dart';
import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardAdminPage extends StatelessWidget {
  DashboardAdminPage({super.key});

  final List<List<String>> menu = [
    ["Stock Item", "assets/receive.png", RouterName.stockItemAdminPage],
    ["Add Item", "assets/plus.png", RouterName.addItemAdminPage],
    [
      "Item Requests",
      "assets/shopping-list.png",
      RouterName.itemRequestsAdminPage
    ],
    ["Orders Statuses", "assets/check.png", RouterName.orderStatusAdminPage],
    [
      "Retrieved Items",
      "assets/download.png",
      RouterName.retrieveItemAdminPage
    ],
    ["Item Reports", "assets/report.png", RouterName.itemReportsAdminPage],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(children: [
            FlutterSwitch(
                activeIcon: const Icon(
                  Icons.dark_mode,
                  color: Colors.black,
                ),
                inactiveIcon: const Icon(Icons.light_mode),
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onToggle: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme()),
            const Spacer(),
            GestureDetector(
              onTap: () => context.pushNamed(RouterName.settingsPage),
              child: const Text("settings"),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("anjing");
                Provider.of<User>(context, listen: false).isLogin = false;
                context.goNamed(RouterName.loginPageName);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.lock,
                    size: 24,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "Log Out",
                    style: GoogleFonts.poppins(fontSize: 20),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text(
          "Aplikasi Data BMN ATK",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            const MyLogo(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .125,
                  vertical: 10.0),
              child: const Divider(),
            ),
            Text(
              "Menu Data",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Theme.of(context).colorScheme.primary),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1,
                  vertical: 10.0),
              child: const Divider(),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return DashboardTile(
                      route: menu[index][2],
                      imagePath: menu[index][1],
                      menuName: menu[index][0]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
