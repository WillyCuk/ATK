import 'package:atk/router/routernamed.dart';
import 'package:atk/utils/dashboardtile.dart';
import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/../Colors/colors.dart';

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
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: AppColor.appBarBackground,
        foregroundColor: AppColor.appBarForeground,
        title: Text(
          "Aplikasi Data BMN ATK",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyLogo(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .125,
                  vertical: 10.0),
              child: Divider(
                thickness: 3,
                color: AppColor.blueDivider,
              ),
            ),
            Text(
              "Menu Data",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: AppColor.mainText),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1,
                  vertical: 10.0),
              child: Divider(
                thickness: 3,
                color: AppColor.blueDivider,
              ),
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
