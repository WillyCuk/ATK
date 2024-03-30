import 'package:atk/pages/login.dart';
import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:atk/utils/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyLogo(),
            Text(
              "Aplikasi Pendataan",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Text(
              "Alat Tulis Kantor",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            Text(
              "Forgot Password",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
              child: MyTextField(text: "Email"),
            ),
            const MyButton(
              text: "SUBMIT",
              route: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}
