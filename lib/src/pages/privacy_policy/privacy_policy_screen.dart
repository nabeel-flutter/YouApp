import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/privacy_policy/components/privacy_policy_body.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: "Privacy Policy",
      isBackAppBar: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrivacyPolicyBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
