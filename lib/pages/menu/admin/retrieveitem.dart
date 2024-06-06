import "package:atk/providers/itemlist.dart";
import "package:atk/providers/userorder.dart";
import "package:atk/utils/itemtile.dart";
import "package:atk/utils/ordertile.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

class ItemRetrieveAdmin extends StatelessWidget {
  const ItemRetrieveAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final List acceptOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((e) => e["order"]["status"] == "Approved")
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text(
          "Retrieve Item - Admin",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          // Listview dibawah digunakan untuk merender bagian awal tampilan yang berisi purchase order + id dan tanggal
          child: acceptOrder.isNotEmpty
              ? ListView.builder(
                  itemCount: acceptOrder.length,
                  itemBuilder: (context, index) {
                    debugPrint(
                        acceptOrder[index]["order"]["status"].toString());

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
                                              "Purchased Order ${acceptOrder[index]["order"]['id'].toString().padLeft(3, '0')}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16)),
                                          const Spacer(),
                                          Text(
                                              acceptOrder[index]["order"]
                                                  ["date"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Expanded(
                                        // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                        child: ListView.builder(
                                            itemCount: acceptOrder[index]
                                                    ["order"]["items"]
                                                .length,
                                            itemBuilder:
                                                (context, secondIndex) {
                                              List itemList = Provider.of<
                                                      ItemList>(context)
                                                  .items
                                                  .where(
                                                    (element) =>
                                                        element[0] ==
                                                        acceptOrder[index]
                                                                    ["order"]
                                                                ["items"]
                                                            [secondIndex]["id"],
                                                  )
                                                  .toList();
                                              debugPrint(itemList.toString());
                                              return ItemTile(
                                                itemName: itemList[0][1],
                                                itemBrand: itemList[0][2],
                                                itemDesc: itemList[0][3],
                                                qty: acceptOrder[index]["order"]
                                                            ["items"]
                                                        [secondIndex]["qty"]
                                                    .toString(),
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
                        orderNumber: acceptOrder[index]["order"]['id']
                            .toString()
                            .padLeft(3, '0'),
                        user: acceptOrder[index]["user"],
                        date: acceptOrder[0]["order"]["date"],
                      ),
                    );
                  })
              : Container()),
    );
  }
}
