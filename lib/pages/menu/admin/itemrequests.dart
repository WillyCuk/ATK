import 'package:atk/providers/userorder.dart';
import 'package:atk/utils/mybutton.dart';
import 'package:atk/utils/ordertile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/itemlist.dart';

class ItemRequestAdmin extends StatelessWidget {
  const ItemRequestAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final List fullOrder = Provider.of<UserOrder>(context).userOrderList;
    debugPrint(fullOrder.toString());
    final List waitingOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((e) => e["order"]["status"] == "Waiting")
        .toList();
    debugPrint(waitingOrder.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text(
          "Request Items",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          // Listview dibawah digunakan untuk merender bagian awal tampilan yang berisi purchase order + id dan tanggal
          child: ListView.builder(
              itemCount: waitingOrder.length,
              itemBuilder: (context, index) {
                // debugPrint(waitingOrder[index]["order"]["status"].toString());
                if (waitingOrder[index]["order"]["status"] == "Waiting") {
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
                                            "Purchased Order ${waitingOrder[index]["order"]['id'].toString().padLeft(3, '0')}",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16)),
                                        const Spacer(),
                                        Text(
                                            waitingOrder[index]["order"]
                                                ["date"],
                                            style: GoogleFonts.poppins(
                                                fontSize: 16)),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                      child: ListView.builder(
                                          itemCount: waitingOrder[index]
                                                  ["order"]["items"]
                                              .length,
                                          itemBuilder: (context, secondIndex) {
                                            List itemList =
                                                Provider.of<ItemList>(context)
                                                    .items
                                                    .where(
                                                      (element) =>
                                                          element[0] ==
                                                          waitingOrder[index]
                                                                      ["order"]
                                                                  ["items"][
                                                              secondIndex]["id"],
                                                    )
                                                    .toList();
                                            debugPrint(itemList.toString());
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
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  itemList[0]
                                                                      [2],
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .blueGrey)),
                                                              Text(
                                                                  itemList[0]
                                                                      [3],
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
                                                          waitingOrder[index]["order"]
                                                                          [
                                                                          "items"]
                                                                      [
                                                                      secondIndex]
                                                                  ["qty"]
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      14)),
                                                      const SizedBox(width: 15),
                                                      Text("Pulpen",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: MyButton(
                                              text: "REJECT",
                                              onPressed: () {
                                                debugPrint("reject");
                                                Provider.of<UserOrder>(context,
                                                        listen: false)
                                                    .changeStatusRejected(
                                                  index: waitingOrder[index]
                                                      ["order"]['id'],
                                                  message: "tayang",
                                                );
                                                Navigator.pop(context);
                                              }),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: MyButton(
                                              text: "APPROVE",
                                              onPressed: () {
                                                debugPrint(waitingOrder[index]
                                                        ["order"]['id']
                                                    .toString());
                                                Provider.of<UserOrder>(context,
                                                        listen: false)
                                                    .changeStatusApproved(
                                                        index:
                                                            waitingOrder[index]
                                                                    ["order"]
                                                                ['id']);
                                                Navigator.pop(context);
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: OrderTile(
                      orderNumber: waitingOrder[index]["order"]['id']
                          .toString()
                          .padLeft(3, '0'),
                      user: waitingOrder[index]["user"],
                      date: waitingOrder[index]["order"]["date"],
                    ),
                  );
                } else {
                  return Container();
                }
              })),
    );
  }
}
