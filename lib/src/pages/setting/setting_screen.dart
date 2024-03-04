import 'package:new_beginnings/src/app/app_export.dart';

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
