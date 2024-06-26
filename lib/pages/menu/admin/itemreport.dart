import 'package:atk/utils/report_graph.dart';
import 'package:atk/utils/report_num.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemReportAdmin extends StatefulWidget {
  const ItemReportAdmin({super.key});

  @override
  State<ItemReportAdmin> createState() => _ItemReportAdminState();
}

class _ItemReportAdminState extends State<ItemReportAdmin> {
  bool isFilterYear = false;
  String _selectedVal = "2";
  String? _selectedYear;
  late List monthList;
  late List itemList;
  late String brand;
  late String type;
  late String desc;

  final tabs = ['Text', 'Graph'];

  @override
  void initState() {
    super.initState();
    _selectedYear = DateTime.now().year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Item Report",
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          bottom: TabBar(indicatorColor: Colors.black, tabs: [
            for (final tab in tabs)
              Tab(
                child: Text(tab,
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              ),
          ]),
        ),
        body: const TabBarView(children: [ReportNum(), ReportGraph()]),
      ),
    );
  }
}
