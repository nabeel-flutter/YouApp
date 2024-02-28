import 'package:new_beginnings/src/app/app_export.dart';

class OTPHeader extends StatelessWidget {
  const OTPHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: const AssetImage(AssetsConstants.nbAuthLogo),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 40),
            Text('OTP Verification',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            Text(
              'Enter the verification code we just sent on your email address.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.subTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
