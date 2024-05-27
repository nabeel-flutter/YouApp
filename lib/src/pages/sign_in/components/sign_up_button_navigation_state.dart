import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/pages/sign_in/components/app_button.dart';
import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_button_validation_cubit.dart';
import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_cubit.dart';

class SignUpButtonVadationState extends StatelessWidget {
  const SignUpButtonVadationState({
    super.key,
    required this.formKey,
    required this.title,
  });

  final String title;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInButtonValidationCubit,
        SignInButtonValidationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          enabled: () {
            return AppButton(
              enabled: true,
              title: title,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignInCubit>().signIn();
                }
              },
            );
          },
          disabled: () {
            return AppButton(
              enabled: false,
              title: title,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignInCubit>().signIn();
                }
              },
            );
          },
        );
      },
    );
  }
}
