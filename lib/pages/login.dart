import 'package:atk/pages/dashboard.dart';
import 'package:atk/pages/fpassword.dart';
import 'package:atk/pages/register.dart';
import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:atk/utils/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              "Login Account",
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
            const MyTextField(text: "Email"),
            const SizedBox(height: 20),
            const MyTextField(text: "Password"),
            const SizedBox(height: 20),
            MyButton(text: "LOGIN", route: DashboardPage()),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                  vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w300,
                        letterSpacing: -1,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 74, 173)),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPage()));
              },
              child: Text(
                "Forgot Password ?",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 74, 173),
                    letterSpacing: -1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
