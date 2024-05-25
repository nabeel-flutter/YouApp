import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/util/navigation_util.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/icon/apple_icon.svg",
              //height: 62,
            ),
            SvgPicture.asset(
              "assets/icon/facebook_icon.svg",
              //height: 62,
            ),
            SvgPicture.asset(
              "assets/icon/google_icon.svg",
              //height: 62,
            ),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            text: StringConstants.newAccount,
            children: [
              TextSpan(
                text: StringConstants.createAccount,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.lightBlue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigationUtil.push(
                      context,
                      RouteConstants.signUpRoute,
                    );
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
