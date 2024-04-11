import 'package:atk/providers/user.dart';
import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:atk/utils/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void onLogin(BuildContext context) {
    final user = context.read<User>();
    final userControllerText = userController.text;
    final passControllerText = passController.text;
    user.login(user: userControllerText, pwd: passControllerText);
    if (user.isLogin) {
      context.goNamed('dashboard-admin');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
          duration: Duration(seconds: 1),
        ),
      );
      return; // Return to avoid further execution
    }
  }

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
            MyTextField(
                text: "Email", controller: userController, obscure: false),
            const SizedBox(height: 20),
            MyTextField(
                text: "Password", controller: passController, obscure: true),
            const SizedBox(height: 20),
            MyButton(text: "LOGIN", onPressed: () => onLogin(context)),
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const RegisterPage()));
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ForgotPage()));
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
