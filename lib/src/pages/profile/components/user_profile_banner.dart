import 'package:flutter/material.dart';
import 'package:your_app_test/src/constant/assets_constants.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/pages/profile/components/profile_chip_component.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
    required this.profile,
  });

  final GetProfileDto profile;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
            image: profile.birthday != null
                ? const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AssetsConstants.profileImage))
                : null,
            color: const Color(0xff162329),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('@${profile.username ?? ""}, ${profile.age ?? ""}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.936,
                          letterSpacing: -0.23)),
                  profile.birthday != null
                      ? Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines

                          children: [
                              ProfileChipsComponent(title: profile.horoscope),
                              ProfileChipsComponent(title: profile.zodiac)
                            ])
                      : Container()
                ])));
  }
}
