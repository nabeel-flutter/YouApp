import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/constant/route_constants.dart';
import 'package:e_finder/src/components/liner_gradient_text.dart';

class RegisterHereTextButton extends StatelessWidget {
  const RegisterHereTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.router.pushNamed(RouteConstants.signUpRoute);
        },
        child: RichText(
            text: TextSpan(
                text: 'No account? ',
                style: const TextStyle(
                    color: ColorConstants.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
                children: [
              TextSpan(
                text: 'Register here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = linearGradientText(colors: [
                      Color(0xff94783E),
                      Color(0xffF3EDA6),
                      Color(0xffF8FAE5),
                      Color(0xffFFE2BE),
                      Color(0xffD5BE88),
                      Color(0xffF8FAE5),
                      Color(0xffD5BE88),
                    ]),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.pushNamed(RouteConstants.signUpRoute);
                  },
              ),
            ])));
  }
}
