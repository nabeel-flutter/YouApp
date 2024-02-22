import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: ColorConstants.white),
                  Container(),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to new beginning',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
