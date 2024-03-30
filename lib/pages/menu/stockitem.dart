import 'package:atk/utils/stocktile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StockItem extends StatelessWidget {
  StockItem({super.key});

  final List item = [
    ["Pulpen", "Boldliner", "100 Pcs"],
    ["Kertas A4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
    ["Kertas F4", "Bola Dunia", "100 Rim"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stock Item",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.menu)
          ],
        ),
        backgroundColor: Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) => StockTile(
                  name: item[index][0],
                  merk: item[index][1],
                  qty: item[index][2]))),
    );
  }
}
