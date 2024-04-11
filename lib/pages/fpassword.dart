// import 'package:atk/pages/login.dart';
// import 'package:atk/utils/MyButton.dart';
// import 'package:atk/utils/logo.dart';
// import 'package:atk/utils/mytextfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ForgotPage extends StatelessWidget {
//   const ForgotPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
// SizedBox(height: MediaQuery.of(context).size.height * .1),
//             const MyLogo(),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
//               child: Divider(
//                 thickness: 3,
//                 color: Color.fromARGB(255, 29, 39, 54),
//               ),
//             ),
//             Text(
//               "Forgot Password",
//               style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.bold, fontSize: 26),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//               child: Divider(
//                 thickness: 3,
//                 color: Color.fromARGB(255, 5, 44, 96),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
//               child: MyTextField(text: "Email"),
//             ),
//             const MyButton(
//               text: "SUBMIT",
//               route: LoginPage(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
