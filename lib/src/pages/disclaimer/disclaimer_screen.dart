import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/disclaimer/components/disclaimer_body.dart';

class DisClaimerScreen extends StatelessWidget {
  const DisClaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customGradientBg,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  CustomAppBar(title: "Disclaimer"),
                  DisClaimerBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
