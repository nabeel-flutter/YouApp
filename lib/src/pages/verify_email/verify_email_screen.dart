import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/pages/verify_email/components/verify_email_body.dart';
import 'package:your_app_test/src/pages/verify_email/components/verify_email_header.dart';

@RoutePage()
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const VerifyEmailHeader(),
              VerifyEmailBody(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
