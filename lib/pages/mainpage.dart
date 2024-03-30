import 'package:atk/pages/login.dart';
import 'package:atk/pages/register.dart';
import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              padding: EdgeInsets.fromLTRB(70.0, 15.0, 70.0, 25.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            const MyButton(
              text: "REGISTER",
              route: RegisterPage(),
            ),
            const SizedBox(height: 30),
            const MyButton(
              text: "LOGIN",
              route: LoginPage(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(70.0, 25.0, 70.0, 45.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            Text(
              "Forgot Password ?",
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: const Color.fromARGB(255, 0, 74, 173),
                  letterSpacing: -1),
            )
          ],
        ),
      ),
    );
  }
}
