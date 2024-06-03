import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/components/main_scaffold.dart';
import 'package:e_finder/src/constant/route_constants.dart';
import 'package:e_finder/src/data/dto/get_profile_dto.dart';
import 'package:e_finder/src/components/app_bar_component.dart';
import 'package:e_finder/src/pages/profile/components/user_profile_banner.dart';
import 'package:e_finder/src/pages/profile/components/user_profile_information_about.dart';
import 'package:e_finder/src/pages/profile/components/user_profile_information_interests.dart';

class UserProfileState extends StatelessWidget {
  const UserProfileState({
    super.key,
    required this.profile,
  });
  final GetProfileDto profile;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        isGradient: false,
        appBar: AppBarWidget(
          title: '@${profile.username ?? ""}',
          actions: [
            IconButton(
              onPressed: () {
                context.router.pushNamed(RouteConstants.settingRoute);
              },
              icon: Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(children: [
                UserProfileBanner(profile: profile),
                SizedBox(height: 24),
                UserProfileInforamtionAbout(profile: profile),
                SizedBox(height: 24),
                UserProfileInforamationInterest(profile: profile)
              ])),
        ));
  }
}
