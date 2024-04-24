import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:atk/utils/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * .25),
            const MyLogo(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 5.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            Text(
              "Register Account",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 5, 44, 96),
              ),
            ),
            MyTextField(
              text: "Full Name",
              controller: nameController,
              obscure: false,
            ),
            const SizedBox(height: 20),
            MyTextField(
              text: "Email",
              controller: emailController,
              obscure: false,
            ),
            const SizedBox(height: 20),
            MyTextField(
              text: "Password",
              controller: passController,
              obscure: true,
            ),
            const SizedBox(height: 20),
            MyTextField(
              text: "Re-Password",
              controller: cPassController,
              obscure: true,
            ),
            const SizedBox(height: 20),
            MyButton(
              text: "Register",
              onPressed: () {
                context.pushNamed("login");
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w300,
                        letterSpacing: -1,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    "Login",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        letterSpacing: -1,
                        fontSize: 18,
                        color: const Color.fromARGB(255, 0, 74, 173)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
