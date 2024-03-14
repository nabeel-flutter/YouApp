import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/forgot_password/cubit/forget_password_cubit.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController email = TextEditingController();
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => Container(),
          error: (message) =>
              ToastComponent3(context).showToast(context, message),
          loaded: (message) =>
              ToastComponent2(context).showToast(context, message),
        );
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormFieldComponent(
                  textInputType: TextInputType.emailAddress,
                  controller: email,
                  hintText: 'Enter Your Email'),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .forgetPassword(email: email.text);
                    }

                    // context.router.push(const OTPRoute());
                  },
                  child: Text(
                    StringConstants.sendCode,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorConstants.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  )),
              const SizedBox(height: 40),
              _rememberPassword(context),
            ],
          ),
        );
      },
    );
  }

  Widget _rememberPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: StringConstants.rememberPassword,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorConstants.subTextColor),
        children: [
          TextSpan(
            text: StringConstants.login,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorConstants.primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.pushNamed(RouteConstants.signInRoute);
              },
          ),
        ],
      ),
    );
  }
}
