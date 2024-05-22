import 'package:atk/providers/userorder.dart';
import 'package:atk/utils/ordertile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../providers/itemlist.dart';

class AprrovedOrderAdmin extends StatelessWidget {
  const AprrovedOrderAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final List approvedOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((e) => e["order"]["status"] == "Approved")
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Approved Order",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.menu)
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          // Listview dibawah digunakan untuk merender bagian awal tampilan yang berisi purchase order + id dan tanggal
          child: ListView.builder(
              itemCount: approvedOrder.length,
              itemBuilder: (context, index) {
                // Penggunaan Gesture Detector agar setiap container yang dibuat bisa di klik untuk menampilkan detail purchase order
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          "Purchased Order ${approvedOrder[index]["order"]['id'].toString().padLeft(3, '0')}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16)),
                                      const Spacer(),
                                      Text(approvedOrder[0]["order"]["date"],
                                          style: GoogleFonts.poppins(
                                              fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                    child: ListView.builder(
                                        itemCount: approvedOrder[index]["order"]
                                                ["items"]
                                            .length,
                                        itemBuilder: (context, secondIndex) {
                                          List itemList =
                                              Provider.of<ItemList>(context)
                                                  .items
                                                  .where(
                                                    (element) =>
                                                        element[0] ==
                                                        approvedOrder[index]
                                                                    ["order"]
                                                                ["items"]
                                                            [secondIndex]["id"],
                                                  )
                                                  .toList();
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 9.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          itemList[0][1],
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(itemList[0][2],
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .blueGrey)),
                                                            Text(itemList[0][3],
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        fontSize:
                                                                            14))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                        approvedOrder[index][
                                                                            "order"]
                                                                        [
                                                                        "items"]
                                                                    [
                                                                    secondIndex]
                                                                ["qty"]
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14)),
                                                    const SizedBox(width: 15),
                                                    Text("Pulpen",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: OrderTile(
                    orderNumber: approvedOrder[index]["order"]['id']
                        .toString()
                        .padLeft(3, '0'),
                    user: approvedOrder[index]["user"],
                    date: approvedOrder[0]["order"]["date"],
                  ),
                );
              })),
    );
  }
}
