import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/route/app_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyTheme? theme;

  @override
  void initState() {
    _navigateAfterDelay();
    super.initState();
  }

  void _navigateAfterDelay() {
    Timer(const Duration(seconds: 1), () async {
      getIt
          .get<SharedPreferencesUtil>()
          .getString(SharedPreferenceConstants.apiAuthToken)
          .then((value) async => value != null
              ? await context.router.pushAndPopUntil(
                  predicate: (route) => false, const HomeRoute())
              : await context.router.pushAndPopUntil(
                  predicate: (route) => false, const SignInRoute()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder: (context, theme, child) {
        this.theme = theme;
        return const MainScaffold(
          isGradient: false,
          body: Center(child: Text('The New Beginning')),
        );
      },
    );
  }
}
