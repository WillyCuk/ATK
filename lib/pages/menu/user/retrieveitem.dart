import "package:atk/providers/itemlist.dart";
import "package:atk/providers/user.dart";
import "package:atk/providers/userorder.dart";
import "package:atk/utils/itemtile.dart";
import "package:atk/utils/mybutton.dart";
import "package:atk/utils/mysnackbar.dart";
import "package:atk/utils/ordertile.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

class ItemRetrieveUser extends StatelessWidget {
  const ItemRetrieveUser({super.key});

  @override
  Widget build(BuildContext context) {
    final String user = Provider.of<User>(context).user;
    final List acceptOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((order) =>
            order["user"] == user &&
            order["order"]["status"] == "Approved" &&
            order["order"]["retrieve_user"] != true)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Retrieve Item - User",
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
                    debugPrint(acceptOrder[index].toString());

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      const SizedBox(height: 14),
                                      Text("Nama Penerima",
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text(acceptOrder[index]["user"],
                                          style: GoogleFonts.poppins(
                                              fontSize: 16)),
                                      const SizedBox(height: 4),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Text("Tanggal Permintaan",
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text(acceptOrder[index]["order"]["date"],
                                          style: GoogleFonts.poppins(
                                              fontSize: 16)),
                                      const SizedBox(height: 4),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      const SizedBox(height: 14),
                                      Text("Permintaan",
                                          style: GoogleFonts.poppins(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 18)),
                                      const SizedBox(height: 10),
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
                                      const SizedBox(height: 10),
                                      acceptOrder[index]["order"]
                                                  ["retrieve_user"] !=
                                              null
                                          ? SizedBox(
                                              width: double.infinity,
                                              child: MyButton(
                                                  text: "DONE",
                                                  onPressed: () {
                                                    try {
                                                      Provider.of<UserOrder>(
                                                              context,
                                                              listen: false)
                                                          .changeRetrieveUserStatus(
                                                              index: acceptOrder[
                                                                          index]
                                                                      ["order"]
                                                                  ["id"]);
                                                      Navigator.pop(context);
                                                    } catch (e) {
                                                      String errorMessage = e
                                                          .toString()
                                                          .split(':')
                                                          .last
                                                          .trim();
                                                      showTopSnackBar(context,
                                                          errorMessage);
                                                    }
                                                  }),
                                            )
                                          : const SizedBox()
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
                        date: acceptOrder[index]["order"]["date"],
                        retrieveStatus: acceptOrder[index]["order"]
                            ["retrieve_user"],
                      ),
                    );
                  })
              : Container()),
    );
  }
}
