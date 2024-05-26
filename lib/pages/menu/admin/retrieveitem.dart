import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class ItemRetrieveAdmin extends StatelessWidget {
  const ItemRetrieveAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text(
          "Retrieve Item - Admin",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
