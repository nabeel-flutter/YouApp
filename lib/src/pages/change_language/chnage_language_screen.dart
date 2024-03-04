import 'package:new_beginnings/src/app/app_export.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      isBackAppBar: true,
      appbarText: StringConstants.changeLanguage,
      body: const SelectRadioListComponent(
        isLanguage: true,
      ),
    );
  }
}
