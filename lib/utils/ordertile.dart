import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTile extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String user;

  const OrderTile({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      padding: const EdgeInsets.only(bottom: 9.0),
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color.fromARGB(255, 5, 44, 96), width: 2))),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Purchase Order $orderNumber",
                    style: GoogleFonts.poppins(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user,
                    style: GoogleFonts.poppins(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Text(
              date,
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }
}
