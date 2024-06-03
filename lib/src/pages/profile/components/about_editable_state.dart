import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/constant/assets_constants.dart';
import 'package:e_finder/src/data/dto/get_profile_dto.dart';
import 'package:e_finder/src/pages/profile/components/about_edit_element_component.dart';
import 'package:e_finder/src/pages/profile/components/about_edit_title.dart';
import 'package:e_finder/src/pages/profile/components/home_card_component.dart';
import 'package:e_finder/src/pages/profile/cubit/get_profile_cubit.dart';
import 'package:e_finder/src/pages/profile/formatter/date_formatter.dart';

class AboutEditableState extends StatelessWidget {
  const AboutEditableState({
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
          AboutEditTitle(),
          SizedBox(
            height: 31,
          ),
          Row(children: [
            Container(
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white.withOpacity(0.07)),
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(AssetsConstants.addImageIcon))),
            SizedBox(width: 15),
            Text('Add image',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ]),
          SizedBox(height: 29),
          Column(
            children: [
              AboutEditElementWidget(
                  title: 'Display name:',
                  field: TextFormField(
                      initialValue: BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .name ??
                          "",
                      textAlign: TextAlign.end,
                      onChanged: (value) =>
                          BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .setName = value,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Enter Name',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)))),
              AboutEditElementWidget(
                  title: 'Birthday:',
                  field: TextFormField(
                      inputFormatters: [DateInputFormatter()],
                      initialValue: BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .birthday ??
                          "",
                      textAlign: TextAlign.end,
                      // controller: TextEditingController(),
                      onChanged: (value) =>
                          BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .setBirthday = value,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Enter date of birth',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)))),
              AboutEditElementWidget(
                  title: 'Horoscope:',
                  field: TextFormField(
                      initialValue: BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .horoscope ??
                          "-",
                      enabled: false,
                      textAlign: TextAlign.end,
                      // controller: TextEditingController(),
                      style: TextStyle(color: Colors.white.withOpacity(0.3)),
                      decoration: InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.white..withOpacity(0.3)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)))),
              AboutEditElementWidget(
                  title: 'Zodiac:',
                  field: TextFormField(
                      enabled: false,
                      initialValue: BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .zodiac ??
                          "-",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white.withOpacity(0.3)),
                      decoration: InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.white..withOpacity(0.3)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)))),
              AboutEditElementWidget(
                title: 'Height:',
                field: TextFormField(
                  initialValue: BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .height !=
                          null
                      ? BlocProvider.of<GetProfileCubit>(context)
                          .profileData!
                          .height
                          .toString()
                      : "",
                  textAlign: TextAlign.end,
                  // controller: TextEditingController(),
                  onChanged: (value) =>
                      BlocProvider.of<GetProfileCubit>(context)
                          .profileData!
                          .setHeight = int.parse(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter height in cm',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
              AboutEditElementWidget(
                title: 'Weight:',
                field: TextFormField(
                  initialValue: BlocProvider.of<GetProfileCubit>(context)
                              .profileData!
                              .weight !=
                          null
                      ? BlocProvider.of<GetProfileCubit>(context)
                          .profileData!
                          .weight
                          .toString()
                      : "",
                  textAlign: TextAlign.end,
                  // controller: TextEditingController(),
                  onChanged: (value) =>
                      BlocProvider.of<GetProfileCubit>(context)
                          .profileData!
                          .setWeight = int.parse(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter wieght in kg',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
