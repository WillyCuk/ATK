import 'package:atk/providers/itemlist.dart';
import 'package:atk/utils/stocktile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockItemUser extends StatelessWidget {
  const StockItemUser({super.key});

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
            const Icon(Icons.menu)
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: ListView.builder(
              itemCount: context.watch<ItemList>().items.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      debugPrint(index.toString());
                      context.push("/item_details_user/$index");
                    },
                    child: StockTile(
                        itemName: context.watch<ItemList>().items[index][0],
                        itemCode: context.watch<ItemList>().items[index][1],
                        qty: context
                            .watch<ItemList>()
                            .items[index][2]
                            .toString()),
                  ))),
    );
  }
}

class StockItemAdmin extends StatelessWidget {
  const StockItemAdmin({super.key});

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
            const Icon(Icons.menu)
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed("add-item");
        },
        shape: const CircleBorder(),
        tooltip: 'increment',
        backgroundColor: const Color.fromARGB(255, 5, 44, 96),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: ListView.builder(
          itemCount: context.watch<ItemList>().items.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.push("/item_details_admin/$index");
            },
            child: StockTile(
                itemName: context.watch<ItemList>().items[index][1],
                itemCode: context.watch<ItemList>().items[index][2],
                qty: context.watch<ItemList>().items[index][3].toString()),
          ),
        ),
      ),
    );
  }
}
