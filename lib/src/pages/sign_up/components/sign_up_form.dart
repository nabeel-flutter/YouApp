import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_finder/src/components/text_field_component.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/pages/sign_up/components/already_account.dart';
import 'package:e_finder/src/pages/sign_up/components/sign_up_button.dart';
import 'package:e_finder/src/pages/sign_up/cubit/sign_up_button_validation_cubit.dart';
import 'package:e_finder/src/pages/sign_up/cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    BlocProvider.of<SignUpButtonValidationCubit>(context).checkIsValidate();
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormFieldComponent(
         hintColor: Color(0xFF9747FF),
lableColor: Color(0xFF9747FF),
textColor: Color(0xFF9747FF),
lable: "Email",
               onChanged: (value) =>
                BlocProvider.of<SignUpButtonValidationCubit>(context)
                    .checkIsValidate(),
            borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
            controller: BlocProvider.of<SignUpCubit>(context).emailController,
            hintText: 'Enter Email',
            textInputType: TextInputType.emailAddress,
          ),
          TextFormFieldComponent(   hintColor: Color(0xFF9747FF),
lableColor: Color(0xFF9747FF),
textColor: Color(0xFF9747FF),
         lable: "User Name",
            onChanged: (value) =>
                BlocProvider.of<SignUpButtonValidationCubit>(context)
                    .checkIsValidate(),
            borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
            controller:
                BlocProvider.of<SignUpCubit>(context).userNameController,
            hintText: 'Create Username',
            textInputType: TextInputType.name,
          ),
          TextFormFieldComponent(
               hintColor: Color(0xFF9747FF),
lableColor: Color(0xFF9747FF),
textColor: Color(0xFF9747FF),
         lable: "Password",
            onChanged: (value) =>
                BlocProvider.of<SignUpButtonValidationCubit>(context)
                    .checkIsValidate(),
            borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
            controller:
                BlocProvider.of<SignUpCubit>(context).passwordController,
            hintText: 'Password',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),

          TextFormFieldComponent(
               hintColor: Color(0xFF9747FF),
lableColor: Color(0xFF9747FF),
textColor: Color(0xFF9747FF),
         lable: "Confirm Password",
            onChanged: (value) =>
                BlocProvider.of<SignUpButtonValidationCubit>(context)
                    .checkIsValidate(),
            borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
            controller:
                BlocProvider.of<SignUpCubit>(context).confirmPasswordController,
            hintText: 'Confirm Password',
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          SignUpButton(formKey: _formKey),
          const SizedBox(height: 20),
          const Align(
              alignment: Alignment.bottomRight, child: AlreadyAccount()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
