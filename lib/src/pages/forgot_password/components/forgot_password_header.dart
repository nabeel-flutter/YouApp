import 'package:flutter/material.dart';
import 'package:your_app_test/src/constant/assets_constants.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/constant/string_constants.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image(
              image: const AssetImage(AssetsConstants.logo),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 40),
            Text(
              StringConstants.forgotPassword,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(height: 20),
            Text(
              StringConstants.forgotPasswordDescription,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Palette.subTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
