import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/constant/assets_constants.dart';
import 'package:your_app_test/src/theme/palette.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/constant/shared_preference_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/cubit/is_gradient_background_cubit.dart';
import 'package:your_app_test/src/pages/setting/components/app_tile_component.dart';
import 'package:your_app_test/src/pages/setting/components/text_component_setting_main.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/theme/get_theme_state.dart';
import 'package:your_app_test/src/theme/switch_theme.dart';
import 'package:your_app_test/src/theme/theme_switch.dart';
import 'package:your_app_test/src/util/navigation_util.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponentSettingMainHeading(
                text: StringConstants.generalSettings),

            AppTileComponent(
              isExpandable: false,
              onTap: () => NavigationUtil.push(
                  context, RouteConstants.changeLanguageRoute),
              image: AssetsConstants.chnageLanguageIcon,
              test: StringConstants.changeLanguage,
            ),
            AppTileComponent(
              isExpandable: false,
              onTap: () => NavigationUtil.push(
                  context, RouteConstants.changeLocationRoute),
              image: AssetsConstants.changeLocationIcon,
              test: StringConstants.changeLocation,
            ),
            TextComponentSettingMainHeading(
                text: StringConstants.otherSettings),
            ThemeSwitchApp(
                value: false,
                image: AssetsConstants.notificationIcon,
                onChnage: (value) async {},
                text: StringConstants.notification),
            ThemeSwitchApp(
                value: false,
                image: AssetsConstants.newsLetterIcon,
                onChnage: (value) async {},
                text: StringConstants.newsletters),
            ThemeSwitchApp(
                value: false,
                image: AssetsConstants.offersAndPromotionIcon,
                onChnage: (value) async {},
                text: StringConstants.offersAndPromotions),
            ThemeSwitchApp(
                value: !getThemeStateIsLight(),
                image: AssetsConstants.lightDarkIcon,
                onChnage: (value) async {
                  switchThemeApp();
                  BlocProvider.of<IsGradientBackgroundCubit>(context)
                      .updateStateDarkLight(value: value);
                },
                text: StringConstants.themeDarkLight),
            //logout
            GestureDetector(
              onTap: () {
                getIt
                    .get<SharedPreferencesUtil>()
                    .removeValue(SharedPreferenceConstants.apiAuthToken)
                    .then((value) async => await context.router.pushAndPopUntil(
                        predicate: (route) => false, const SignInRoute()));
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        'Logout',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Palette.subTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
