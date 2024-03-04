import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const UserProfileComponent(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  getIt
                      .get<SharedPreferencesUtil>()
                      .removeValue(SharedPreferenceConstants.apiAuthToken)
                      .then((value) async => await context.router
                          .pushAndPopUntil(
                              predicate: (route) => false,
                              const SignInRoute()));
                },
                child: const Text('Logout'))
          ]),
        ),
        isBackAppBar: false,
        appbarText: StringConstants.profile);
  }
}
