import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/new_password/components/new_password_body.dart';
import 'package:new_beginnings/src/pages/new_password/components/new_password_header.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              NewPasswordHeader(),
              NewPasswordBody(),
            ],
          ),
        ),
      ),
    );
  }
}
