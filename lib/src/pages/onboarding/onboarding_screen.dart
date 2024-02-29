import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/route/app_router.dart';

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
        children: [
          Expanded(
            child: Stack(children: [
              Image.asset(
                AssetsConstants.onboardingImage,
                fit: BoxFit.cover,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: ColorConstants.primaryColor.withOpacity(0.2),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  StringConstants.onboardingTitle,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: ColorConstants.primaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  StringConstants.onboardingDescription,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorConstants.primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      context.router.push(const SignInRoute());
                    },
                    child: Text(
                      StringConstants.getStarted,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorConstants.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                    )),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
