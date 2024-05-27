import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_test/src/constant/color_constants.dart';
import 'package:your_app_test/src/constant/shared_preference_constants.dart';
import 'package:your_app_test/src/constant/string_constants.dart';
import 'package:your_app_test/src/constant/toast_component.dart';
import 'package:your_app_test/src/di/injector.dart';
import 'package:your_app_test/src/pages/sign_in/components/sign_up_button_navigation_state.dart';
import 'package:your_app_test/src/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:your_app_test/src/route/app_router.dart';
import 'package:your_app_test/src/util/shared_preferences_util.dart';

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
