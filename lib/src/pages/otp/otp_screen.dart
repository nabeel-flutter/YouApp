import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      isGradient: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              OTPHeader(),
              OTPBody(),
            ],
          ),
        ),
      ),
    );
  }
}
