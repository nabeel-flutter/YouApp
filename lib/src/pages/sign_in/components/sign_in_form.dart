import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/components/text_field_component.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/pages/sign_in/components/register_here_text_button.dart';
import 'package:your_app_test/src/pages/sign_in/components/sign_in_button.dart';
import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_button_validation_cubit.dart';

import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    BlocProvider.of<SignInButtonValidationCubit>(context).checkIsValidate();
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const SizedBox(height: 25),
          TextFormFieldComponent(
              onChanged: (value) {
                BlocProvider.of<SignInButtonValidationCubit>(context)
                    .checkIsValidate();
              },
              borderRadius: 12,
              borderColor: ColorConstants.white.withOpacity(0.00),
              fillColor: ColorConstants.white.withOpacity(0.06),
              hintText: "Enter Email",
              controller: BlocProvider.of<SignInCubit>(context).emailController,
              textInputType: TextInputType.emailAddress),
          const SizedBox(height: 5),
          TextFormFieldComponent(
              onChanged: (value) {
                BlocProvider.of<SignInButtonValidationCubit>(context)
                    .checkIsValidate();
              },
              borderRadius: 12,
              textInputType: TextInputType.visiblePassword,
              hintText: "Enter Password",
              borderColor: ColorConstants.white.withOpacity(0.00),
              fillColor: ColorConstants.white.withOpacity(0.06),
              isPassword: true,
              controller:
                  BlocProvider.of<SignInCubit>(context).passwordController),
          const SizedBox(height: 15),
          SignInButton(formKey: formKey),
          const SizedBox(height: 50),
          RegisterHereTextButton()
        ],
      ),
    );
  }
}





