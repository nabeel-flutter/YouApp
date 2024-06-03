import 'package:flutter/material.dart';
import 'package:e_finder/src/constant/assets_constants.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/constant/string_constants.dart';

class NewPasswordHeader extends StatelessWidget {
  const NewPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Image(
            image: const AssetImage(AssetsConstants.logo),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 20),
          Text(
            StringConstants.createNewPassword,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(height: 20),
          Text(
            StringConstants.createNewPasswordDescription,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorConstants.subTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
