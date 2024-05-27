import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/components/main_scaffold.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/pages/profile/components/app_bar_component.dart';
import 'package:your_app_test/src/pages/setting/components/setting_screen_body.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      isGradient: true,
      appBar: AppBarWidget(
        title: StringConstants.settings,
        isBack: true,
      ),
      body: const SettingScreenBody(),
    );
  }
}
