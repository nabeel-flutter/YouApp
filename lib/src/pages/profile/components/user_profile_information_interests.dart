import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/pages/profile/components/home_card_component.dart';
import 'package:your_app_test/src/pages/profile/components/home_edit_card_component.dart';
import 'package:your_app_test/src/components/chip_component.dart';

class UserProfileInforamationInterest extends StatelessWidget {
  const UserProfileInforamationInterest({
    super.key,
    required this.profile,
  });

  final GetProfileDto profile;

  @override
  Widget build(BuildContext context) {
    return HomeCardComponent(
        profile: profile,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeEditCardComponent(
                onTap: () {
                  context.router.pushNamed(RouteConstants.interestRoute);
                },
                title: 'Interest',
              ),
              SizedBox(height: 15),
              profile.interests!.isNotEmpty
                  ? Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 10.0, // gap between lines

                      children: profile.interests!
                          .asMap()
                          .entries
                          .map((item) =>
                              ProfileChipsComponent(title: item.value))
                          .toList(),
                    )
                  : Text(
                      'Add in your interest to find a better match',
                      style: TextStyle(
                        color: Color(0xffffffff).withOpacity(0.52),
                        fontWeight: FontWeight.w500,
                      ),
                    )
            ]));
  }
}

