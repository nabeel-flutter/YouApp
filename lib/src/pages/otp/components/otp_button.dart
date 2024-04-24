import 'package:your_app_test/src/app/app_export.dart';

class OTPButton extends StatelessWidget {
  const OTPButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              context.router.push(const NewPasswordRoute());
            },
            child: Text(
              'Verify',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        RichText(
          text: TextSpan(
            text: 'Problem with code? ',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorConstants.subTextColor),
            children: [
              TextSpan(
                text: 'Resend Code',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorConstants.primaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
