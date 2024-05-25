import 'package:atk/router/routernamed.dart';
import 'package:atk/utils/MyButton.dart';
import 'package:atk/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Colors/colors.dart' as color;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            const MyLogo(),
            Text(
              "Aplikasi Pendataan",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: color.AppColor.mainText,
              ),
            ),
            Text(
              "Alat Tulis Kantor",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: color.AppColor.mainText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70.0, 15.0, 70.0, 25.0),
              child: Divider(
                thickness: 3,
                color: color.AppColor.blueDivider,
              ),
            ),
            MyButton(
              text: "REGISTER",
              onPressed: () => context.goNamed(RouterName.registerPageName),
            ),
            const SizedBox(height: 30),
            MyButton(
              text: "LOGIN",
              onPressed: () => context.goNamed(RouterName.loginPageName),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70.0, 25.0, 70.0, 45.0),
              child: Divider(
                thickness: 3,
                color: color.AppColor.blueDivider,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(RouterName.forgotPassPage);
              },
              child: Text(
                "Forgot Password ?",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: color.AppColor.blueButtonText,
                    letterSpacing: -1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
