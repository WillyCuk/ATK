import 'package:atk/providers/userorder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Colors/colors.dart';
import '../../../providers/itemlist.dart';
import '../../../utils/ordertile.dart';

class OrderStatusAdmin extends StatefulWidget {
  const OrderStatusAdmin({super.key});

  @override
  State<OrderStatusAdmin> createState() => _OrderStatusAdminState();
}

class _OrderStatusAdminState extends State<OrderStatusAdmin> {
  bool isApproved = false;
  bool isRejected = false;
  bool isFilterYear = false;
  String? _selectedVal;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> allOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((element) =>
            element["order"]["status"] == "Approved" ||
            element["order"]["status"] == "Rejected")
        .toList();
    debugPrint(allOrder.toString());
    List<Map<String, dynamic>> approvedOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((element) => element["order"]["status"] == "Approved")
        .toList();
    List<Map<String, dynamic>> rejectedOrder = Provider.of<UserOrder>(context)
        .userOrderList
        .where((element) => element["order"]["status"] == "Rejected")
        .toList();

    List<Map<String, dynamic>> yearOrder = allOrder
        .where((order) => order['order']['date'].split(' ')[2] == _selectedVal)
        .toList();

    List<String> uniqueYears = allOrder
        .map<String>((order) {
          String date = order['order']['date'];
          return date.split(' ')[2];
        })
        .toSet()
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Order Statuses",
          ),
          centerTitle: true,
          backgroundColor: AppColor.appBarBackground,
          foregroundColor: AppColor.appBarForeground,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    child: ChoiceChip(
                        showCheckmark: false,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        selectedColor: Colors.pink,
                        label: Text(
                          "Approved",
                          style: GoogleFonts.poppins(),
                        ),
                        selected: isApproved,
                        onSelected: (val) {
                          setState(() {
                            isApproved = !isApproved;
                            isRejected = false;
                            isFilterYear = false;
                            _selectedVal = null;
                          });
                        }),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                      showCheckmark: false,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      selectedColor: Colors.pink,
                      label: Text(
                        "Rejected",
                        style: GoogleFonts.poppins(),
                        textAlign: TextAlign.center,
                      ),
                      selected: isRejected,
                      onSelected: (val) {
                        setState(() {
                          isRejected = !isRejected;
                          isApproved = false;
                          isFilterYear = false;
                          _selectedVal = null;
                        });
                      }),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      hint: Text(
                        "Filter by year",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      iconSize: 18,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.blueDivider,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.blueDivider,
                          ),
                        ),
                      ),
                      value: _selectedVal,
                      items: uniqueYears
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: SizedBox(height: 20, child: Text(e)),
                            ),
                          )
                          .toList(),
                      elevation: 0,
                      focusColor: Colors.transparent,
                      onChanged: (String? val) {
                        setState(() {
                          _selectedVal = val!;
                          isFilterYear = true;
                          isApproved = false;
                          isRejected = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            !isApproved && !isRejected && isFilterYear
                ? Expanded(
                    child: ListView.builder(
                      itemCount: yearOrder.length,
                      itemBuilder: ((context, index) {
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
                                                  "Purchased Order ${yearOrder[index]["order"]['id'].toString().padLeft(3, '0')}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16)),
                                              const Spacer(),
                                              Text(
                                                  yearOrder[0]["order"]["date"],
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16)),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Expanded(
                                            // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                            child: ListView.builder(
                                                itemCount: yearOrder[index]
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
                                                            yearOrder[index][
                                                                        "order"]
                                                                    ["items"][
                                                                secondIndex]["id"],
                                                      )
                                                      .toList();
                                                  debugPrint(
                                                      itemList.toString());
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 9.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  itemList[0]
                                                                      [1],
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
                                                                            color:
                                                                                Colors.blueGrey)),
                                                                    Text(
                                                                        itemList[0]
                                                                            [3],
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14))
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                                yearOrder[index]["order"]["items"]
                                                                            [
                                                                            secondIndex]
                                                                        ["qty"]
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        fontSize:
                                                                            14)),
                                                            const SizedBox(
                                                                width: 15),
                                                            Text("Pulpen",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        fontSize:
                                                                            14))
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
                            orderNumber: yearOrder[index]["order"]['id']
                                .toString()
                                .padLeft(3, '0'),
                            user: yearOrder[index]["user"],
                            date: yearOrder[0]["order"]["date"],
                          ),
                        );
                      }),
                    ),
                  )
                : isApproved
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: approvedOrder.length,
                          itemBuilder: ((context, index) {
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16)),
                                                  const Spacer(),
                                                  Text(
                                                      approvedOrder[index]
                                                          ["order"]["date"],
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16)),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Expanded(
                                                // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                                child: ListView.builder(
                                                    itemCount:
                                                        approvedOrder[index]
                                                                    ["order"]
                                                                ["items"]
                                                            .length,
                                                    itemBuilder:
                                                        (context, secondIndex) {
                                                      List itemList =
                                                          Provider.of<ItemList>(
                                                                  context)
                                                              .items
                                                              .where(
                                                                (element) =>
                                                                    element[
                                                                        0] ==
                                                                    approvedOrder[index]["order"]
                                                                            [
                                                                            "items"]
                                                                        [
                                                                        secondIndex]["id"],
                                                              )
                                                              .toList();
                                                      debugPrint(
                                                          itemList.toString());
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 9.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      itemList[
                                                                          0][1],
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            itemList[0][
                                                                                2],
                                                                            style:
                                                                                GoogleFonts.poppins(fontSize: 14, color: Colors.blueGrey)),
                                                                        Text(
                                                                            itemList[0][
                                                                                3],
                                                                            style:
                                                                                GoogleFonts.poppins(fontSize: 14))
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                                const Spacer(),
                                                                Text(
                                                                    approvedOrder[index]["order"]["items"][secondIndex]
                                                                            [
                                                                            "qty"]
                                                                        .toString(),
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            14)),
                                                                const SizedBox(
                                                                    width: 15),
                                                                Text("Pulpen",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            14))
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
                                date: approvedOrder[index]["order"]["date"],
                              ),
                            );
                          }),
                        ),
                      )
                    : isRejected
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: rejectedOrder.length,
                              itemBuilder: ((context, index) {
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
                                                          "Purchased Order ${rejectedOrder[index]["order"]['id'].toString().padLeft(3, '0')}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      16)),
                                                      const Spacer(),
                                                      Text(
                                                          rejectedOrder[0]
                                                              ["order"]["date"],
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      16)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Expanded(
                                                    // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                                    child: ListView.builder(
                                                        itemCount:
                                                            rejectedOrder[index]
                                                                        [
                                                                        "order"]
                                                                    ["items"]
                                                                .length,
                                                        itemBuilder: (context,
                                                            secondIndex) {
                                                          List itemList = Provider
                                                                  .of<ItemList>(
                                                                      context)
                                                              .items
                                                              .where(
                                                                (element) =>
                                                                    element[
                                                                        0] ==
                                                                    rejectedOrder[index]["order"]
                                                                            [
                                                                            "items"]
                                                                        [
                                                                        secondIndex]["id"],
                                                              )
                                                              .toList();
                                                          debugPrint(itemList
                                                              .toString());
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        9.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          itemList[0]
                                                                              [
                                                                              1],
                                                                          style:
                                                                              GoogleFonts.poppins(fontSize: 14),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(itemList[0][2],
                                                                                style: GoogleFonts.poppins(fontSize: 14, color: Colors.blueGrey)),
                                                                            Text(itemList[0][3],
                                                                                style: GoogleFonts.poppins(fontSize: 14))
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const Spacer(),
                                                                    Text(
                                                                        rejectedOrder[index]["order"]["items"][secondIndex]["qty"]
                                                                            .toString(),
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14)),
                                                                    const SizedBox(
                                                                        width:
                                                                            15),
                                                                    Text(
                                                                        "Pulpen",
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14))
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
                                    orderNumber: rejectedOrder[index]["order"]
                                            ['id']
                                        .toString()
                                        .padLeft(3, '0'),
                                    user: rejectedOrder[index]["user"],
                                    date: rejectedOrder[0]["order"]["date"],
                                  ),
                                );
                              }),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: allOrder.length,
                              itemBuilder: ((context, index) {
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
                                                          "Purchased Order ${allOrder[index]["order"]['id'].toString().padLeft(3, '0')}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      16)),
                                                      const Spacer(),
                                                      Text(
                                                          allOrder[index]
                                                              ["order"]["date"],
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      16)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Expanded(
                                                    // Listview disini digunakan untuk merender setiap item detail dalam purchase order masing-masing
                                                    child: ListView.builder(
                                                        itemCount: allOrder[
                                                                        index]
                                                                    ["order"]
                                                                ["items"]
                                                            .length,
                                                        itemBuilder: (context,
                                                            secondIndex) {
                                                          List itemList = Provider
                                                                  .of<ItemList>(
                                                                      context)
                                                              .items
                                                              .where(
                                                                (element) =>
                                                                    element[0] ==
                                                                    allOrder[index]["order"]
                                                                            [
                                                                            "items"]
                                                                        [
                                                                        secondIndex]["id"],
                                                              )
                                                              .toList();
                                                          debugPrint(itemList
                                                              .toString());
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        9.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          itemList[0]
                                                                              [
                                                                              1],
                                                                          style:
                                                                              GoogleFonts.poppins(fontSize: 14),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(itemList[0][2],
                                                                                style: GoogleFonts.poppins(fontSize: 14, color: Colors.blueGrey)),
                                                                            Text(itemList[0][3],
                                                                                style: GoogleFonts.poppins(fontSize: 14))
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const Spacer(),
                                                                    Text(
                                                                        allOrder[index]["order"]["items"][secondIndex]["qty"]
                                                                            .toString(),
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14)),
                                                                    const SizedBox(
                                                                        width:
                                                                            15),
                                                                    Text(
                                                                        "Pulpen",
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14))
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
                                    orderNumber: allOrder[index]["order"]['id']
                                        .toString()
                                        .padLeft(3, '0'),
                                    user: allOrder[index]["user"],
                                    date: allOrder[index]["order"]["date"],
                                  ),
                                );
                              }),
                            ),
                          )
          ]),
        ));
  }
}
