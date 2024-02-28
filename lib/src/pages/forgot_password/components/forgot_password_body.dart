import 'package:new_beginnings/src/app/app_export.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Column(
      children: [
        TextFormFieldComponent(controller: email, hintText: 'Enter Your Email'),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              context.router.push(const OTPRoute());
            },
            child: Text(
              'Send Code',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            )),
        const SizedBox(height: 40),
        _rememberPassword(context),
      ],
    );
  }

  Widget _rememberPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Remember Password? ',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorConstants.subTextColor),
        children: [
          TextSpan(
            text: 'Sign In',
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
