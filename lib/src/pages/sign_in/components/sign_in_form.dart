import 'package:auto_route/auto_route.dart';
import 'package:control_style/control_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/components/text_field_component.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/route_constants.dart';
import 'package:your_app_test/src/constant/shared_preference_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/constant/toast_component.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_button_validation_cubit.dart';

import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

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

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) => state.maybeWhen(orElse: () {
              return null;
            }, error: (message) async {
              ToastComponent3(context).showToast(context, message);
              return null;
            }, loaded: (token) async {
              await getIt
                  .get<SharedPreferencesUtil>()
                  .setString(
                      SharedPreferenceConstants.apiAuthToken, token.accessToken)
                  .then((value) => context.router.pushAndPopUntil(
                      predicate: (route) => false, const HomeRoute()));
              return null;
            }),
        builder: (context, state) => state.maybeWhen(
            loading: () => SignUpButtonVadationState(
                formKey: formKey, title: StringConstants.login),
            loaded: (token) => SignUpButtonVadationState(
                formKey: formKey, title: StringConstants.login),
            error: (message) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SignUpButtonVadationState(
                        formKey: formKey, title: StringConstants.login),
                    const SizedBox(height: 10),
                    Text(message,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorConstants.redIndicatorColor))
                  ]);
            },
            orElse: () => SignUpButtonVadationState(
                formKey: formKey, title: StringConstants.login)));
  }
}

class RegisterHereTextButton extends StatelessWidget {
  const RegisterHereTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.router.pushNamed(RouteConstants.signUpRoute);
        },
        child: RichText(
            text: TextSpan(
                text: 'No account? ',
                style: const TextStyle(
                    color: ColorConstants.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
                children: [
              TextSpan(
                text: 'Register here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = linearGradientText(colors: [
                      Color(0xff94783E),
                      Color(0xffF3EDA6),
                      Color(0xffF8FAE5),
                      Color(0xffFFE2BE),
                      Color(0xffD5BE88),
                      Color(0xffF8FAE5),
                      Color(0xffD5BE88),
                    ]),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.pushNamed(RouteConstants.signUpRoute);
                  },
              ),
            ])));
  }
}

Shader linearGradientText({required List<Color> colors}) {
  return LinearGradient(
    colors: colors, // Gradient colors
    begin: Alignment.bottomLeft, // Gradient start position
    end: Alignment.bottomRight, // Gradient end position
  ).createShader(
      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)); // Text bounding box
}

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

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.enabled,
    this.isErrorButton = false,
  });

  final VoidCallback onPressed;
  final String title;
  final bool enabled;
  final bool? isErrorButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
            autofocus: false,
            style: isErrorButton == true
                ? disableStyle(isErrorButton: isErrorButton)
                : enabled == true
                    ? null
                    : disableStyle(),
            onPressed: enabled == true ? () => onPressed() : null,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            )),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorConstants.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
        )
      ],
    );
  }

  ButtonStyle disableStyle({bool? isErrorButton = false}) {
    return ButtonStyle(
        shape: MaterialStateProperty.resolveWith((states) {
          return DecoratedOutlinedBorder(
              shadow: isErrorButton == true
                  ? [
                      GradientShadow(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color.fromARGB(255, 205, 98, 98)
                                    .withOpacity(0.5),
                                Color.fromARGB(255, 219, 69, 69)
                                    .withOpacity(0.5),
                              ]),
                          blurRadius: 12,
                          offset: const Offset(0, 14))
                    ]
                  : [],
              backgroundGradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: isErrorButton == true
                      ? [
                          Color.fromARGB(255, 205, 98, 98),
                          Color.fromARGB(255, 219, 69, 69)
                        ]
                      : [
                          const Color(0xff62CDCB).withOpacity(0.5),
                          const Color(0xff4599DB).withOpacity(0.5)
                        ]),
              child: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)));
        }),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent));
  }
}
