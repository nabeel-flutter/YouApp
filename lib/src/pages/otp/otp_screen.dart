import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/pages/otp/components/otp_body.dart';
import 'package:your_app_test/src/pages/otp/components/otp_header.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      isGradient: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              OTPHeader(),
              OTPBody(),
            ],
          ),
        ),
      ),
    );
  }
}
