import 'package:your_app_test/src/app/app_export.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        OTPFields(),
        SizedBox(height: 10),
        OTPButton(),
      ],
    );
  }
}
