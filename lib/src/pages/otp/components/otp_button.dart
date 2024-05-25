import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/route/app_router.dart';

class OTPButton extends StatelessWidget {
  const OTPButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              context.router.push(const NewPasswordRoute());
            },
            child: Text(
              'Verify',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Palette.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        RichText(
          text: TextSpan(
            text: 'Problem with code? ',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Palette.subTextColor),
            children: [
              TextSpan(
                text: 'Resend Code',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Palette.primaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
