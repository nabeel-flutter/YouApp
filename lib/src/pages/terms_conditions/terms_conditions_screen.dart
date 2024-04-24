import 'package:your_app_test/src/app/app_export.dart';

@RoutePage()
class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: "Terms & Conditions",
      isBackAppBar: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TermsConditionsBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
