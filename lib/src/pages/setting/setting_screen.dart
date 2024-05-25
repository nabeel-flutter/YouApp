import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/is_gradient_background_component.dart';
import 'package:your_app_test/src/pages/setting/components/setting_screen_body.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: StringConstants.settings,
      isBackAppBar: false,
      body: const SettingScreenBody(),
    );
  }
}
