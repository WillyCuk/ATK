import 'package:atk/utils/itemtextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String _dropDownValue = "1";
  var _items = ['1', 'Pcs', 'Rim'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Item",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.menu)
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            ItemTextField(text: "Item Name"),
            ItemTextField(text: "Item Type"),
            ItemTextField(text: "Item Description"),
            ItemTextField(text: "Item Quantity"),
            ItemTextField(text: "Item Price"),
          ],
        )),
      ),
    );
  }
}
