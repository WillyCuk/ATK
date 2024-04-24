import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:atk/utils/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            const MyLogo(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 29, 39, 54),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
              child: MyTextField(
                text: "Email",
                controller: emailController,
                obscure: false,
              ),
            ),
            MyButton(
              text: "SUBMIT",
              onPressed: () {
                context.pushNamed("dashboard-user");
              },
            ),
          ],
        ),
      ),
    );
  }
}
