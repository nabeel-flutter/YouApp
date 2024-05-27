import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/constant/toast_component.dart';
import 'package:your_app_test/src/pages/sign_in/components/app_button.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_button_validation_cubit.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_cubit.dart';

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
