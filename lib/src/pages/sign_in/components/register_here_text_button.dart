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
                text: 'Don\'t have an accout? ',
                style: const TextStyle(
                    color: ColorConstants.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                children: [
              TextSpan(
                text: 'Register here',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  height: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = linearGradientText(
                        colors: [Color(0xFF9747FF), Color(0xFF9747FF)]),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.pushNamed(RouteConstants.signUpRoute);
                  },
              ),
            ])));
  }
}
