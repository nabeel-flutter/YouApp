import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_finder/src/components/main_scaffold.dart';
import 'package:e_finder/src/pages/forgot_password/components/forgot_password_body.dart';
import 'package:e_finder/src/pages/forgot_password/components/forgot_password_header.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
