import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/verify_email/components/verift_email_body.dart';
import 'package:new_beginnings/src/pages/verify_email/components/verift_email_header.dart';

@RoutePage()
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return  MainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              VerifyEmailHeader(),
              VerifyEmailBody(email : email),
            ],
          ),
        ),
      ),
    );
  }
}
