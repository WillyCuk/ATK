import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockTile extends StatelessWidget {
  final String name;
  final String merk;
  final String qty;
  const StockTile(
      {super.key, required this.name, required this.merk, required this.qty});

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
                name,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 8),
              Text(
                merk,
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
