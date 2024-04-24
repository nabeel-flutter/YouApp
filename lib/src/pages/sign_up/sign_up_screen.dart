import 'package:your_app_test/src/app/app_export.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  context.router.pop();
                },  
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,  
                  
                  children: [
                    Icon(Icons.arrow_back_ios, color: ColorConstants.white),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),              ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
             Row(
                children: [
                const SizedBox(
                  width: 20,
                ),   Text(
                    StringConstants.register,
                    style: const TextStyle(
                      color: ColorConstants.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
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
