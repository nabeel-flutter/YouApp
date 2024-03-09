import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              ForgotPasswordHeader(),
              ForgotPasswordBody(),
            ],
          ),
        ),
      ),
    );
  }
}
