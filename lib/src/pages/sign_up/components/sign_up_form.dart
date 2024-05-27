import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/components/text_field_component.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/constant/toast_component.dart';
import 'package:your_app_test/src/pages/sign_in/components/sign_in_form.dart';
import 'package:your_app_test/src/pages/sign_up/components/already_account.dart';
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () =>
            SignUpButtonState(formKey: _formKey, title: StringConstants.signUp),
        loading: () =>
            SignUpButtonState(formKey: _formKey, title: StringConstants.signUp),
        error: (message) => Column(
          children: [
            SignUpButtonState(formKey: _formKey, title: StringConstants.signUp),
            const SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorConstants.redIndicatorColor),
            ),
          ],
        ),
      ),
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        error: (message) {
          ToastComponent3(context).showToast(context, message);
          return null;
        },
        initial: () => null,
        loaded: (token) {
          ToastComponent2(context).showToast(
              context, 'User Created successfully please check your email');
          return Navigator.pop(context);
        },
      ),
    );
  }
}

class SignUpButtonState extends StatelessWidget {
  const SignUpButtonState({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.title,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpButtonValidationCubit,
        SignUpButtonValidationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          enabled: () => AppButton(
            enabled: true,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (BlocProvider.of<SignUpCubit>(context)
                        .confirmPasswordController
                        .text ==
                    BlocProvider.of<SignUpCubit>(context)
                        .passwordController
                        .text) {
                  context.read<SignUpCubit>().signUp();
                } else {
                  ToastComponent3(context)
                      .showToast(context, 'Password not match');
                }
              }
            },
            title: title,
          ),
          disabled: () => AppButton(
            enabled: false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (BlocProvider.of<SignUpCubit>(context)
                        .confirmPasswordController
                        .text ==
                    BlocProvider.of<SignUpCubit>(context)
                        .passwordController
                        .text) {
                  context.read<SignUpCubit>().signUp();
                } else {
                  ToastComponent3(context)
                      .showToast(context, 'Password not match');
                }
              }
            },
            title: title,
          ),
        );
      },
    );
  }
}
