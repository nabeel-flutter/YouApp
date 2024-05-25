import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/theme/palette.dart';

class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: Palette.primaryColor,
                  color: Palette.primaryColor,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
