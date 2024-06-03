import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:e_finder/src/constant/color_constants.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            inactiveColor: ColorConstants.subTextColor.withOpacity(0.5),
            inactiveFillColor: ColorConstants.white,
            selectedColor: ColorConstants.primaryColor,
            fieldWidth: 54,
            inactiveBorderWidth: 2.2,
            activeFillColor: ColorConstants.white,
            activeColor: ColorConstants.primaryColor),
      ),
    );
  }
}
