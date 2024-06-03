import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/components/main_scaffold.dart';
import 'package:e_finder/src/constant/string_constants.dart';
import 'package:e_finder/src/components/app_bar_component.dart';
import 'package:e_finder/src/pages/setting/components/setting_screen_body.dart';

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
