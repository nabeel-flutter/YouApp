import 'package:new_beginnings/src/app/app_export.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PinCodeTextField(
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
