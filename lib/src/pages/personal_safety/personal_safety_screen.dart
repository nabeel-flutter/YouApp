import 'package:new_beginnings/src/app/app_export.dart';

class PersonalSafetyScreen extends StatelessWidget {
  const PersonalSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Container(),
      isGradient: false,
      appBar: AppBarcomponent(
          isGradient: false,
          title: StringConstants.personalSafety,
          isBackAppBar: true,
          isTitleTowLines: false),
    );
  }
}
