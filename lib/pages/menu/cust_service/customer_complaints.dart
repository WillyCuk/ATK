import 'package:atk/providers/c_service.dart';
import 'package:atk/utils/complaint_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerComplaintPage extends StatelessWidget {
  const CustomerComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final complaints = Provider.of<CustomerComplaint>(context).complaints;
    return Scaffold(
      appBar: AppBar(title: const Text('Complaints')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  'Customer Complaints',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const Divider(thickness: 1.0),
              const SizedBox(height: 16),
              complaints.isEmpty
                  ? Center(
                      child: Text(
                        'No complaints available.',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: complaints.length,
                      itemBuilder: (context, index) {
                        final complaint = complaints[index];
                        return ComplaintCard(complaint: complaint);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
