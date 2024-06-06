import 'package:atk/providers/user.dart';
import 'package:atk/utils/mypagebutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person_2,
                    size: 48,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      user.user,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      user.email,
                      style: GoogleFonts.quicksand(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.quicksand(),
                      ),
                      Text(
                        user.user,
                        style: GoogleFonts.quicksand(fontSize: 18),
                      )
                    ],
                  ),
                  Text(
                    'Edit',
                    style: GoogleFonts.quicksand(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.quicksand(),
                      ),
                      Text(
                        user.email,
                        style: GoogleFonts.quicksand(fontSize: 18),
                      )
                    ],
                  ),
                  Text(
                    'Edit',
                    style: GoogleFonts.quicksand(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            //
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyPageButton(
                    text: "CONFIRM",
                    onPressed: () {},
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 50),
                const SizedBox(
                  width: 10,
                ),
                MyPageButton(
                    text: "BACK",
                    onPressed: () {},
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 50)
              ],
            )
          ],
        ),
      ),
    );
  }
}
