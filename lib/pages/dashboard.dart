import 'package:atk/pages/menu/additem.dart';
import 'package:atk/pages/menu/approved.dart';
import 'package:atk/pages/menu/itemdetails.dart';
import 'package:atk/pages/menu/itemreports.dart';
import 'package:atk/pages/menu/itemrequest.dart';
import 'package:atk/pages/menu/retrieve.dart';
import 'package:atk/pages/menu/stockitem.dart';
import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List menu = [
    ["Stock Item", "assets/receive.png", StockItem()],
    ["Add Item", "assets/plus.png", AddItem()],
    ["Approved Item", "assets/check.png", const ApprovedItem()],
    ["Retrieve Item", "assets/download.png", const RetrieveItem()],
    ["Item Details", "assets/file.png", const ItemDetails()],
    ["Item Reports", "assets/report.png", const ItemReports()],
    ["Item Requests", "assets/shopping-list.png", const ItemRequest()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        title: Text(
          "Aplikasi Data BMN ATK",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyLogo(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            Text(
              "Menu Data",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 0.0,
                itemCount: menu.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menu[index][2]),
                      );
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 5, 44, 96),
                                borderRadius: BorderRadius.circular(40)),
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(menu[index][1],
                                fit: BoxFit.contain),
                          )),
                          const SizedBox(height: 7),
                          Text(
                            menu[index][0],
                            style: GoogleFonts.poppins(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(index == menu.length - 1 ? 3 : 1, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
