import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/components/retry_button.dart';
import 'package:your_app_test/src/constant/assets_constants.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/data/dto/get_profile_dto.dart';
import 'package:your_app_test/src/flavors/flavour_banner.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProfileCubit>(context).getProfile();
    return flavorBanner(
        show: true,
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
            listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                loaded: (profile) => profile.getAge(DateTime.now(),
                    DateTime(int.parse(profile.birthday!.split('/').last)))),
            builder: (context, state) => state.maybeWhen(
                orElse: () => Container(),
                loading: () => Skeletonizer(
                    child: UserProfileState(
                        profile: GetProfileDto(
                            username: 'john',
                            name: 'john',
                            interests: ['john']))),
                loaded: (profile) => UserProfileState(profile: profile),
                error: (massange) => RetryState(onTap: () {
                      context.read<GetProfileCubit>().getProfile();
                    }))));
  }
}

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
          title: '@${profile.name ?? ""}',
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
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AssetsConstants.profileImage)),
                      color: const Color(0xff162329),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '@${profile.username ?? ""}, ${profile.age ?? ""}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 1.936,
                                    letterSpacing: -0.23)),
                            const Text('Male',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    height: 1.573,
                                    letterSpacing: -0.23)),
                            Wrap(
                                spacing: 8.0, // gap between adjacent chips
                                runSpacing: 4.0, // gap between lines

                                children: [
                                  ProfileChipsComponent(
                                      title: profile.horoscope),
                                  ProfileChipsComponent(title: profile.zodiac)
                                ])
                          ]))),
              SizedBox(height: 24),
              HomeCardComponent(
                  profile: profile,
                  body: Column(children: [
                    HomeEditCardComponent(
                      onTap: () {},
                      title: StringConstants.about,
                    ),
                    SizedBox(height: 15),
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
                        value: '${profile.weight ?? ""} kg')
                  ])),
              SizedBox(height: 24),
              HomeCardComponent(
                  profile: profile,
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeEditCardComponent(
                          onTap: () {
                            context.router
                                .pushNamed(RouteConstants.interestRoute);
                          },
                          title: 'Interest',
                        ),
                        SizedBox(height: 15),
                        Wrap(
                          children: profile.interests!
                              .asMap()
                              .entries
                              .map((item) =>
                                  ProfileChipsComponent(title: item.value))
                              .toList(),
                        )
                      ]))
            ])));
  }
}

class HomeCardComponent extends StatelessWidget {
  const HomeCardComponent({
    super.key,
    required this.profile,
    required this.body,
  });

  final GetProfileDto profile;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 27),
        decoration: BoxDecoration(
            color: Color(0xff0E191F), borderRadius: BorderRadius.circular(14)),
        child: body);
  }
}

class HomeEditCardComponent extends StatelessWidget {
  const HomeEditCardComponent({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title,
          style: TextStyle(
              height: 1.694,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
      GestureDetector(
          onTap: () => onTap(),
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ))
    ]);
  }
}

class AboutItemsComponent extends StatelessWidget {
  const AboutItemsComponent({
    super.key,
    required this.dynamicKey,
    required this.value,
  });
  final String dynamicKey;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        child: Row(children: [
          RichText(
              text: TextSpan(
                  text: '${dynamicKey} ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.33),
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                  children: [
                TextSpan(
                    text: value,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13))
              ]))
        ]));
  }
}

class ProfileChipsComponent extends StatelessWidget {
  const ProfileChipsComponent({
    Key? key,
    this.title,
    this.onDelete,
    this.isDelete,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onDelete;
  final bool? isDelete;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isDelete == true ? 10 : 100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(isDelete == true ? 10 : 100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Make the Row fit its content
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.23,
                  ),
                ),
                if (isDelete == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: onDelete,
                        child: Icon(
                          Icons.close,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.title = '',
    this.actions,
    this.isBack = false,
  });
  final String? title;

  final List<Widget>? actions;
  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: isBack == true ? 100 : null,
        leading: isBack == true
            ? InkWell(
                onTap: () {
                  context.router.maybePop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        size: 17,
                        Icons.arrow_back_ios,
                        color: ColorConstants.white),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 16,
                        height: 1.7,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              )
            : null,
        title: Text(title!,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white)),
        centerTitle: true,
        actions: actions);
  }
}
