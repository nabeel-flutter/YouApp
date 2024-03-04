import 'package:new_beginnings/src/app/app_export.dart';

class ChangeLocationScreen extends StatelessWidget {
  const ChangeLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      isBackAppBar: true,
      appbarText: StringConstants.changeLocation,
      body: const SelectRadioListComponent(isLanguage: false),
    );
  }
}
