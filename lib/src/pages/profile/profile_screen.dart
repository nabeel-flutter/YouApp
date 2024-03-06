import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const UserProfileComponent(),
          const UserProfileBottomComponent()
        ]),
        isBackAppBar: false,
        appbarText: StringConstants.profile);
  }
}
