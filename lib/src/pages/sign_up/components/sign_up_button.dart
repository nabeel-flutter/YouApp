import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/constant/toast_component.dart';
import 'package:your_app_test/src/pages/sign_up/components/sign_up_button_state.dart';
import 'package:your_app_test/src/pages/sign_up/cubit/sign_up_cubit.dart';

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

