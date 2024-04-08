import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockTile extends StatelessWidget {
  final String itemName;
  final String itemCode;
  final String qty;
  const StockTile(
      {super.key,
      required this.itemName,
      required this.itemCode,
      required this.qty});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      padding: const EdgeInsets.only(bottom: 9.0),
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color.fromARGB(255, 5, 44, 96), width: 2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 8),
              Text(
                itemCode,
                style: GoogleFonts.poppins(color: Colors.grey),
              )
            ],
          ),
          Text(
            qty,
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
