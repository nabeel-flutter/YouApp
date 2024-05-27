import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/components/text_field_component.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/pages/sign_up/components/already_account.dart';
import 'package:your_app_test/src/pages/sign_up/components/sign_up_button.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_button_validation_cubit.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_cubit.dart';

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
            onChanged: (value) => BlocProvider.of<SignUpButtonValidationCubit>(context)
                  .checkIsValidate(),
            borderRadius: 12,
            borderColor: ColorConstants.white.withOpacity(0.00),
            fillColor: ColorConstants.white.withOpacity(0.06),
            controller: BlocProvider.of<SignUpCubit>(context).emailController,
            hintText: 'Enter Email',
            textInputType: TextInputType.emailAddress,
          ),
          TextFormFieldComponent(
            onChanged: (value) => BlocProvider.of<SignUpButtonValidationCubit>(context)
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
            onChanged: (value) => BlocProvider.of<SignUpButtonValidationCubit>(context)
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
            onChanged: (value) => BlocProvider.of<SignUpButtonValidationCubit>(context)
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


