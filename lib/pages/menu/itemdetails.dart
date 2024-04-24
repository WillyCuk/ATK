import 'dart:io';
import 'package:atk/providers/itemlist.dart';
import 'package:atk/utils/mypagebutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ItemDetailsAdmin extends StatefulWidget {
  final List<dynamic> item;
  final int index;
  const ItemDetailsAdmin({super.key, required this.item, required this.index});

  @override
  State<ItemDetailsAdmin> createState() => _ItemDetailsAdminState();
}

class _ItemDetailsAdminState extends State<ItemDetailsAdmin> {
  bool isEdit = false;
  int add = 0;
  late int _qty;

  @override
  void initState() {
    super.initState();
    _qty = widget.item[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stock Item",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.height * .15,
            child: widget.item[6] is XFile
                ? Image.file(
                    File(widget.item[6].path),
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    widget.item[6],
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Name",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  widget.item[1],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Brand",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  widget.item[2],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Type",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  widget.item[4] == "" ? "-" : widget.item[4],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  widget.item[5] == "" ? "-" : widget.item[5],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Quantity",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _qty.toString(),
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Rim",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          isEdit
              ? Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Add Stock",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (add > 0) {
                                  add -= 1;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 16,
                            )),
                        const SizedBox(width: 10),
                        Text(
                          add.toString(),
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                add += 1;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 16,
                            )),
                      ],
                    )),
                  ],
                )
              : Container(),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              MyPageButton(
                  text: isEdit ? "CONFIRM" : "EDIT",
                  onPressed: () {
                    setState(() {
                      if (isEdit) {
                        context
                            .read<ItemList>()
                            .setQty(index: widget.index, qty: _qty + add);
                        _qty += add;
                        add = 0;
                      }
                      isEdit = !isEdit;
                    });
                  },
                  width: MediaQuery.of(context).size.width * .1,
                  height: 40),
            ],
          ),
        ]),
      ),
    );
  }
}

class ItemDetailsUser extends StatelessWidget {
  final List<dynamic> item;
  const ItemDetailsUser({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stock Item",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.height * .15,
            child: item[6] is XFile
                ? Image.file(
                    File(item[6].path),
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    item[6],
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Name",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  item[1],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Brand",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  item[2],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Type",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  item[4] == "" ? "-" : item[4],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  item[5] == "" ? "-" : item[5],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Quantity",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item[3].toString(),
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Rim",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(thickness: 2),
          ),
        ]),
      ),
    );
  }
}
