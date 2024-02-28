import 'dart:ui';

import 'package:new_beginnings/src/app/app_export.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormFieldComponent(
          controller: passwordController,
          hintText: 'New Password',
        ),
        TextFormFieldComponent(
          controller: newPasswordController,
          hintText: 'Confirm Password',
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              //blur the screen and show the pop up
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      color: ColorConstants.white.withOpacity(0.2),
                      child: customDialog(
                        title: 'Password Changed',
                        description:
                            'Your password has been changed successfully',
                        buttonText: 'Continue',
                        onPressed: () {
                          context.router.pushNamed(RouteConstants.signInRoute);
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            )),
        const SizedBox(height: 20),
        _rememberPassword(context),
        const SizedBox(height: 20),
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

  Widget customDialog(
      {required String title,
      required String description,
      required String buttonText,
      required VoidCallback onPressed}) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AssetsConstants.successIcon,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text('Password Changed!',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.black)),
            const SizedBox(height: 20),
            const Text(
              'Your password has been changed successfully',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onPressed();
              },
              child: const Text(
                'Back to Login',
                style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ));
  }
}
