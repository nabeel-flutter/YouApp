import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/pages/profile/components/about_item_component.dart';
import 'package:your_app_test/src/pages/profile/components/home_card_component.dart';
import 'package:your_app_test/src/pages/profile/components/home_edit_card_component.dart';
import 'package:your_app_test/src/pages/profile/cubit/about_cubit.dart';

class AboutViewState extends StatelessWidget {
  const AboutViewState({
    super.key,
    required this.profile,
  });

  final GetProfileDto profile;

  @override
  Widget build(BuildContext context) {
    return HomeCardComponent(
      profile: profile,
      body: Column(
        children: [
          HomeEditCardComponent(
            onTap: () {
              BlocProvider.of<AboutCubit>(context).swichState();
            },
            title: StringConstants.about,
          ),
          SizedBox(height: 15),
          profile.birthday != null
              ? Column(
                  children: [
                    AboutItemsComponent(
                        dynamicKey: 'Birthday:',
                        value:
                            '${profile.birthday ?? ""} (Age ${profile.age ?? 0})'),
                    AboutItemsComponent(
                        dynamicKey: 'Horoscope:',
                        value: '${profile.horoscope ?? ""}'),
                    AboutItemsComponent(
                        dynamicKey: 'Zodiac:',
                        value: '${profile.zodiac ?? ""}'),
                    AboutItemsComponent(
                        dynamicKey: 'Height:',
                        value: '${profile.height ?? ""} cm'),
                    AboutItemsComponent(
                        dynamicKey: 'Weight:',
                        value: '${profile.weight ?? ""} kg'),
                  ],
                )
              : Text(
                  'Add in your your to help others know you better',
                  style: TextStyle(
                    color: Color(0xffffffff).withOpacity(0.52),
                    fontWeight: FontWeight.w500,
                  ),
                )
        ],
      ),
    );
  }
}
