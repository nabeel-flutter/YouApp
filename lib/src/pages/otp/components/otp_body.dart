import 'package:flutter/material.dart';
import 'package:e_finder/src/pages/otp/components/otp_button.dart';
import 'package:e_finder/src/pages/otp/components/otp_fields.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        OTPFields(),
        SizedBox(height: 10),
        OTPButton(),
      ],
    );
  }
}
