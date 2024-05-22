import 'package:atk/router/routernamed.dart';
import 'package:atk/utils/dashboardtile.dart';
import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../providers/theme.dart';

class DashboardUserPage extends StatelessWidget {
  DashboardUserPage({super.key});

  final List<List<String>> menu = [
    ["Stock Item", "assets/receive.png", RouterName.stockItemUserPage],
    [
      "Requests Items",
      "assets/shopping-list.png",
      RouterName.itemRequestsUserPage
    ],
    ["Orders Status", "assets/check.png", RouterName.orderStatusUserPage],
    ["Retrieve Items", "assets/download.png", RouterName.itemRetrieveUserPage],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Switch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme()),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text(
          "Aplikasi Data BMN ATK",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
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
                  }),
            )
          ],
        ),
      ),
    );
  }
}
