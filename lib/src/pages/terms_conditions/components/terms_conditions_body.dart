import 'package:flutter/material.dart';

class TermsConditionsBody extends StatelessWidget {
  const TermsConditionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        ParaWidget(
          heading: "Acceptance of Terms",
          description:
              "By accessing or using our app, you acknowledge and agree to be bound by these Terms & Conditions. These terms constitute a legally binding agreement between you and New Beginnings. If you do not agree with any part of these terms, please refrain from using our app. Your continued use of the app following any modifications to these terms constitutes acceptance of those changes. We reserve the right to update or modify these terms at any time without prior notice.",
        ),
        ParaWidget(
          heading: "User Accounts",
          description:
              "Certain features of our app may require you to create an account. You agree to provide accurate and complete information when registering for an account. You are solely responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. If you suspect any unauthorized use of your account, please notify us immediately. We reserve the right to suspend or terminate your account if we suspect any fraudulent or unauthorized activity.",
        ),
        ParaWidget(
          heading: "Intellectual Property",
          description:
              "All content, including text, images, logos, and graphics, displayed on our app is the property of New Beginnings and is protected by copyright laws. You may not reproduce, distribute, modify, or otherwise use any content from our app without prior written consent from New Beginnings. Any unauthorized use of our intellectual property may result in legal action.",
        ),
        ParaWidget(
          heading: "Disclaimer of Warranties",
          description:
              "While we strive to provide accurate and up-to-date information on our app, we make no warranties or representations about the accuracy, completeness, or reliability of the content. We do not guarantee uninterrupted access to our app or that the app will be error-free. Your use of our app is at your own risk. We disclaim all warranties, express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose, and non-infringement.",
        ),
        ParaWidget(
          heading: "Governing Law:",
          description:
              "These Terms & Conditions shall be governed by and construed in accordance with the laws of USA. Any disputes arising out of these terms shall be resolved through binding arbitration in New Jersey, USA. If any provision of these terms is found to be unlawful, void, or unenforceable, that provision shall be deemed severable from the rest of the terms and shall not affect the validity and enforceability of the remaining provisions.",
        )
      ],
    );
  }
}

class ParaWidget extends StatelessWidget {
  final String heading;
  final String description;
  const ParaWidget({
    super.key,
    this.heading = "",
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
