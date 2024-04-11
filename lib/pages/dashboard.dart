import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardAdminPage extends StatelessWidget {
  DashboardAdminPage({super.key});

  final List<List<String>> menu = [
    ["Stock Item", "assets/receive.png", "stock-item-admin"],
    ["Add Item", "assets/plus.png", "add-item"],
    ["Orders Statuses", "assets/check.png", "approved-item"],
    ["Retrieved Items", "assets/download.png", "retrieve-item"],
    ["Item Requests", "assets/shopping-list.png", "item-request"],
    ["Item Reports", "assets/report.png", "item-report"],
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(menu[index][2]);
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 5, 44, 96),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                menu[index][1],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardUserPage extends StatelessWidget {
  DashboardUserPage({super.key});

  final List<List<String>> menu = [
    ["Stock Item", "assets/receive.png", "stock-item-user"],
    ["Orders Status", "assets/check.png", "approved-item"],
    ["Requests Items", "assets/shopping-list.png", "item-request"],
    ["Retrieve Items", "assets/download.png", "retrieve-item"],
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(menu[index][2]);
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 5, 44, 96),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                menu[index][1],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
