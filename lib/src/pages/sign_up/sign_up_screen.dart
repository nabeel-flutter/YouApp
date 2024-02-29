import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.arrow_back, color: ColorConstants.white),
              const SizedBox(height: 20),
              Image(
                image: const AssetImage(AssetsConstants.nbAuthLogo),
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.createAccount,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    StringConstants.createAccountDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorConstants.subTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              const SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
