import 'package:atk/providers/itemlist.dart';
import 'package:atk/utils/itemtextfield.dart';
import 'package:atk/utils/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _itemBrandController = TextEditingController();
  TextEditingController _itemTypeController = TextEditingController();
  TextEditingController _itemDescController = TextEditingController();
  TextEditingController _itemQtyController = TextEditingController();

  String _dropDownValue = "1";
  var _items = ['1', 'Pcs', 'Rim'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Column(
          children: [
            ItemTextField(text: "Item Name", controller: _itemNameController),
            const SizedBox(height: 25),
            ItemTextField(text: "Item Brand", controller: _itemBrandController),
            const SizedBox(height: 25),
            ItemTextField(text: "Item Type", controller: _itemTypeController),
            const SizedBox(height: 25),
            ItemTextField(
                text: "Item Description", controller: _itemDescController),
            const SizedBox(height: 25),
            ItemTextField(
                text: "Item Quantity", controller: _itemQtyController),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: MyButton(text: "Upload Image", onPressed: () {}),
            ),
            const SizedBox(height: 25),
            MyButton(
                text: "CONFIRM",
                onPressed: () {
                  context.read<ItemList>().addItem(
                      itemName: _itemNameController.text,
                      itemBrand: _itemBrandController.text,
                      itemType: _itemTypeController.text,
                      itemDesc: _itemDescController.text,
                      itemQty: _itemQtyController.text);
                })
          ],
        )),
      ),
    );
  }
}
