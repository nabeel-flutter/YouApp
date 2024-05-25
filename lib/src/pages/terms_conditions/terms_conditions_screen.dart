import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_app_test/src/pages/is_gradient_background_component/is_gradient_background_component.dart';
import 'package:your_app_test/src/pages/terms_conditions/components/terms_conditions_body.dart';

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
