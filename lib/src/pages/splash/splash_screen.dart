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
          .then((value) async => value == null
              ? await context.router.pushAndPopUntil(
                  predicate: (route) => false, const OnboardingRoute())
              : await context.router.pushAndPopUntil(
                  predicate: (route) => false, const HomeRoute()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder: (context, theme, child) {
        this.theme = theme;
        return Scaffold(
            backgroundColor: ColorConstants.primaryColor,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Image.asset(
                  AssetsConstants.splashLogoImage,
                ),
              ),
            ));
      },
    );
  }
}
