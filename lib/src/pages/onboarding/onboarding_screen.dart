import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  // final OnboardingScreenArgs args;

  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      isGradient: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            StringConstants.onboardingText,
            style: FontStylesConstants.gilroy(
              fontFamily: FontConstantc.gilroyRegular,
              fontSize: 30,
              color: ColorConstants.white,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    NavigationUtil.popAllAndPush(
                      context,
                      RouteConstants.homeRoute,
                    );
                  },
                  child: Text(StringConstants.getStarted),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
