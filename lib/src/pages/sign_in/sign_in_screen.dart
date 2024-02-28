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
            ],
          ),
        ),
      ),
    );
  }
}
