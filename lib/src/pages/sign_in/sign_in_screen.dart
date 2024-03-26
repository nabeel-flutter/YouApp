import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      isGradient: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image(
                image: const AssetImage(AssetsConstants.nbAuthLogo),
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              const SignInForm(),
              const SizedBox(height: 20),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By signing up, you are agree to the ",
                    style: const TextStyle(
                      color: ColorConstants.primaryTextColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: const TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            height: 1.5),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushRoute(const TermsConditionsRoute());
                          },
                      ),
                      const TextSpan(
                        text: " and",
                        style: TextStyle(
                          color: ColorConstants.primaryTextColor,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: " Privacy Policy",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushRoute(const PrivacyPolicyRoute());
                          },
                        style: const TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            height: 1.5),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
