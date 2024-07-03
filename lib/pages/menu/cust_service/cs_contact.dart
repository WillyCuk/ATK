import 'package:atk/providers/complaints.dart';
import 'package:atk/providers/user.dart';
import 'package:atk/utils/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CSContact extends StatefulWidget {
  const CSContact({super.key});

  @override
  State<CSContact> createState() => _CSContactState();
}

class _CSContactState extends State<CSContact> {
  void showSuccessDialog(String role) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.done,
              color: Theme.of(context).colorScheme.primary, size: 40),
          title: Text(
            'Success',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          content: Text(
            'Your complaint has been submitted successfully. Please wait for our response and we will get back to you.',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog;
              },
              child: Text(
                'OK',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final complaintProvider = Provider.of<CustomerComplaint>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "CS Contact",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Contact Person",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(children: [
                            const Icon(Icons.phone),
                            Text(
                              ' 08123456789 - Cecilia',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(children: [
                            const Icon(Icons.phone),
                            Text(
                              ' 0824572190 - Jason Wilbert',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ]),
                        ),
                        Divider(
                          thickness: 3,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  "Complain Section",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              // make an input field for complain
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: TextField(
                                  controller:
                                      complaintProvider.complaintController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 7,
                                  minLines: 4,
                                  decoration: InputDecoration(
                                    labelText: 'What\'s your problem?',
                                    labelStyle: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'This complain message will be processed by our customer service, please rest assured',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'For your information, you can contact our Customer Service',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Submit',
                  onPressed: () {
                    complaintProvider.setUserEmail(user.user, user.email);
                    complaintProvider.addComplaint();
                    showSuccessDialog(user.role);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
