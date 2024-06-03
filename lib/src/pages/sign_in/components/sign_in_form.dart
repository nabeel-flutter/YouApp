import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/components/text_field_component.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/pages/sign_in/components/register_here_text_button.dart';
import 'package:e_finder/src/pages/sign_in/components/sign_in_button.dart';
import 'package:e_finder/src/pages/sign_in/cubit/sign_in_button_validation_cubit.dart';

import 'package:e_finder/src/pages/sign_in/cubit/sign_in_cubit.dart';

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
          // const SizedBox(height: 25),
          TextFormFieldComponent(
            hintColor: Color(0xFF9747FF),
            lableColor: Color(0xFF9747FF),
            textColor: Color(0xFF9747FF),
            lable: 'Email',
            onChanged: (value) {
              BlocProvider.of<SignInButtonValidationCubit>(context)
                  .checkIsValidate();
            },
            borderRadius: 100,
            borderColor: Color(0xFF9747FF),
            fillColor: ColorConstants.white.withOpacity(0.06),
            hintText: "Enter Email",
            controller: BlocProvider.of<SignInCubit>(context).emailController,
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xFF9747FF),
            ),
          ),
          const SizedBox(height: 5),
          TextFormFieldComponent(
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF9747FF),
              ),
              hintColor: Color(0xFF9747FF),
              lableColor: Color(0xFF9747FF),
              textColor: Color(0xFF9747FF),
              lable: "Password",
              onChanged: (value) {
                BlocProvider.of<SignInButtonValidationCubit>(context)
                    .checkIsValidate();
              },
              borderRadius: 100,
              textInputType: TextInputType.visiblePassword,
              hintText: "Enter Password",
              borderColor: Color(0xFF9747FF),
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
