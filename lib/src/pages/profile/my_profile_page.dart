import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
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
import 'package:your_app_test/src/pages/profile/cubit/about_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/get_profile_cubit.dart';
import 'package:your_app_test/src/pages/profile/cubit/update_profile_cubit.dart';
import 'package:your_app_test/src/pages/profile/formatter/date_formatter.dart';
import 'package:your_app_test/src/pages/sign_in/components/sign_in_form.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetProfileCubit>(context).getProfile();
    BlocProvider.of<AboutCubit>(context).isEdit = true;

    BlocProvider.of<AboutCubit>(context).swichState();

    return flavorBanner(
        show: true,
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
            listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                loaded: (profile) => profile.birthday != null
                    ? profile.getAge(DateTime.now(),
                        DateTime(int.parse(profile.birthday!.split('/').last)))
                    : null),
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
                Container(
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
                              Text(
                                  '@${profile.username ?? ""}, ${profile.age ?? ""}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 16,
                                      height: 1.936,
                                      letterSpacing: -0.23)),
                              profile.birthday != null
                                  ? Wrap(
                                      spacing:
                                          8.0, // gap between adjacent chips
                                      runSpacing: 4.0, // gap between lines

                                      children: [
                                          ProfileChipsComponent(
                                              title: profile.horoscope),
                                          ProfileChipsComponent(
                                              title: profile.zodiac)
                                        ])
                                  : Container()
                            ]))),
                SizedBox(height: 24),
                BlocConsumer<AboutCubit, AboutState>(
                  listener: (context, state) => state.maybeWhen(
                    orElse: () => null,
                    view: () =>
                        BlocProvider.of<GetProfileCubit>(context).getProfile(),
                  ),
                  builder: (context, state) {
                    return state.maybeWhen(
                      editable: () => HomeCardComponent(
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
                                      child: Image.asset(
                                          AssetsConstants.addImageIcon))),
                              SizedBox(width: 15),
                              Text('Add image',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))
                            ]),
                            SizedBox(height: 29),
                            AboutEditElementWidget(
                                title: 'Display name:',
                                field: TextFormField(
                                    initialValue:
                                        BlocProvider.of<GetProfileCubit>(
                                                    context)
                                                .profileData!
                                                .name ??
                                            "",
                                    textAlign: TextAlign.end,
                                    onChanged: (value) =>
                                        BlocProvider.of<GetProfileCubit>(
                                                context)
                                            .profileData!
                                            .setName = value,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: 'Enter Name',
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0)))),
                            AboutEditElementWidget(
                                title: 'Birthday:',
                                field: TextFormField(
                                    inputFormatters: [DateInputFormatter()],
                                    initialValue:
                                        BlocProvider.of<GetProfileCubit>(
                                                    context)
                                                .profileData!
                                                .birthday ??
                                            "",
                                    textAlign: TextAlign.end,
                                    // controller: TextEditingController(),
                                    onChanged: (value) =>
                                        BlocProvider.of<GetProfileCubit>(
                                                context)
                                            .profileData!
                                            .setBirthday = value,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        hintText: 'Enter Name',
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0)))),
                            AboutEditElementWidget(
                                title: 'Horoscope:',
                                field: TextFormField(
                                    initialValue:
                                        BlocProvider.of<GetProfileCubit>(
                                                    context)
                                                .profileData!
                                                .horoscope ??
                                            "-",
                                    enabled: false,
                                    textAlign: TextAlign.end,
                                    // controller: TextEditingController(),
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.3)),
                                    decoration: InputDecoration(
                                        hintText: 'Enter Name',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Colors.white
                                              ..withOpacity(0.3)),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0)))),
                            AboutEditElementWidget(
                                title: 'Zodiac:',
                                field: TextFormField(
                                    enabled: false,
                                    initialValue:
                                        BlocProvider.of<GetProfileCubit>(
                                                    context)
                                                .profileData!
                                                .zodiac ??
                                            "-",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.3)),
                                    decoration: InputDecoration(
                                        hintText: 'Enter Name',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Colors.white
                                              ..withOpacity(0.3)),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8.0)))),
                            AboutEditElementWidget(
                              title: 'Height:',
                              field: TextFormField(
                                initialValue:
                                    BlocProvider.of<GetProfileCubit>(context)
                                            .profileData!
                                            .height
                                            .toString() ??
                                        "",
                                textAlign: TextAlign.end,
                                // controller: TextEditingController(),
                                onChanged: (value) =>
                                    BlocProvider.of<GetProfileCubit>(context)
                                        .profileData!
                                        .setHeight = int.parse(value),
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Enter Name',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                ),
                              ),
                            ),
                            AboutEditElementWidget(
                              title: 'Weight:',
                              field: TextFormField(
                                initialValue:
                                    BlocProvider.of<GetProfileCubit>(context)
                                            .profileData!
                                            .weight
                                            .toString() ??
                                        "",
                                textAlign: TextAlign.end,
                                // controller: TextEditingController(),
                                onChanged: (value) =>
                                    BlocProvider.of<GetProfileCubit>(context)
                                        .profileData!
                                        .setWeight = int.parse(value),
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Enter Name',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      orElse: () => AboutViewState(profile: profile),
                    );
                  },
                ),
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
                          profile.interests!.isNotEmpty
                              ? Wrap(
                                  spacing: 8.0, // gap between adjacent chips
                                  runSpacing: 10.0, // gap between lines

                                  children: profile.interests!
                                      .asMap()
                                      .entries
                                      .map((item) => ProfileChipsComponent(
                                          title: item.value))
                                      .toList(),
                                )
                              : Text(
                                  'Add in your interest to find a better match',
                                  style: TextStyle(
                                    color: Color(0xffffffff).withOpacity(0.52),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                        ]))
              ])),
        ));
  }
}

class AboutEditElementWidget extends StatelessWidget {
  const AboutEditElementWidget({
    super.key,
    required this.title,
    required this.field,
  });

  final String title;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xffFFFFFF).withOpacity(.33),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.06),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffFFFFFF).withOpacity(0.22),
                ),
              ),
              child: field,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutEditTitle extends StatelessWidget {
  const AboutEditTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('About',
          style: TextStyle(
              height: 1.694,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
      BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (profile) {
              BlocProvider.of<AboutCubit>(context).swichState();
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return RichText(
            text: TextSpan(
              text: 'Save & Update',
              style: TextStyle(
                height: 1.5,
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                foreground: Paint()
                  ..shader = linearGradientText(colors: [
                    Color(0xff94783E),
                    Color(0xffF3EDA6),
                    Color(0xffF8FAE5),
                    Color(0xffFFE2BE),
                    Color(0xffD5BE88),
                    Color(0xffF8FAE5),
                    Color(0xffD5BE88),
                  ]),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => BlocProvider.of<UpdateProfileCubit>(context)
                    .updateProfileCubit(),
            ),
          );
        },
      ),
    ]);
  }
}

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
