import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String text;

  const MyTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: TextField(
        decoration: InputDecoration(
            hintStyle: GoogleFonts.quicksand(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
            hintText: text,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 5, 44, 96), width: 2))),
      ),
    );
  }
}
