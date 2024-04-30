import 'package:atk/Colors/colors.dart';
import 'package:atk/router/routernamed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class StockTile extends StatelessWidget {
  final String routeIndex;
  final String itemName;
  final String itemBrand;
  final String qty;
  const StockTile(
      {super.key,
      required this.routeIndex,
      required this.itemName,
      required this.itemBrand,
      required this.qty});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouterName.itemDetailUserPage,
            pathParameters: {'index': routeIndex});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.only(bottom: 9.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.blueDivider, width: 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: GoogleFonts.poppins(fontSize: 17),
                ),
                const SizedBox(height: 5),
                Text(
                  itemBrand,
                  style: GoogleFonts.poppins(
                      color: AppColor.subtitleText,
                      fontWeight: FontWeight.w200,
                      fontSize: 15),
                )
              ],
            ),
            Text(
              qty,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ),
    );
  }
}
