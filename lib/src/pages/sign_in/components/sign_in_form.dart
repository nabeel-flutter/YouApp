import 'package:auto_route/auto_route.dart';
import 'package:e_finder/src/constant/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/components/text_field_component.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/pages/sign_in/components/register_here_text_button.dart';
import 'package:e_finder/src/pages/sign_in/components/sign_in_button.dart';
import 'package:e_finder/src/pages/sign_in/cubit/sign_in_button_validation_cubit.dart';

import 'package:e_finder/src/pages/sign_in/cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm(
      {super.key,
      required,
      required this.leftOffsetAnimation,
      required this.rightOffsetAnimation});
  final Animation<Offset> leftOffsetAnimation;
  final Animation<Offset> rightOffsetAnimation;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    BlocProvider.of<SignInButtonValidationCubit>(context).checkIsValidate();
    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          // const SizedBox(height: 25),
          SlideTransition(
              position: leftOffsetAnimation,
              child: TextFormFieldComponent(
                  hintColor: Color(0xFF9747FF),
                  lableColor: Color(0xFF9747FF),
                  textColor: Color(0xFF9747FF),
                  lable: 'Email',
                  onChanged: (value) =>
                      BlocProvider.of<SignInButtonValidationCubit>(context)
                          .checkIsValidate(),
                  borderRadius: 100,
                  borderColor: Color(0xFF9747FF),
                  fillColor: ColorConstants.white.withOpacity(0.06),
                  hintText: "Enter Email",
                  controller:
                      BlocProvider.of<SignInCubit>(context).emailController,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email, color: Color(0xFF9747FF)))),
          const SizedBox(height: 5),
          SlideTransition(
              position: rightOffsetAnimation,
              child: TextFormFieldComponent(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF9747FF),
                  ),
                  hintColor: Color(0xFF9747FF),
                  lableColor: Color(0xFF9747FF),
                  textColor: Color(0xFF9747FF),
                  lable: "Password",
                  onChanged: (value) =>
                      BlocProvider.of<SignInButtonValidationCubit>(context)
                          .checkIsValidate(),
                  borderRadius: 100,
                  textInputType: TextInputType.visiblePassword,
                  hintText: "Enter Password",
                  borderColor: Color(0xFF9747FF),
                  fillColor: ColorConstants.white.withOpacity(0.06),
                  isPassword: true,
                  controller: BlocProvider.of<SignInCubit>(context)
                      .passwordController)),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                onPressed: () => context.router
                    .pushNamed(RouteConstants.forgotPasswordRoute),
                child: const Text('Forgot Password?',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF9747FF))))
          ]),
          const SizedBox(height: 15),
          SignInButton(formKey: formKey),
          const SizedBox(height: 20),
          const Row(children: <Widget>[
            Expanded(child: Divider(color: Color(0xFF9747FF), thickness: 2)),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Login With",
                    style: TextStyle(fontSize: 18, color: Color(0xFF9747FF)))),
            Expanded(child: Divider(color: Color(0xFF9747FF), thickness: 2))
          ]),
          RegisterHereTextButton()
        ]));
  }
}
