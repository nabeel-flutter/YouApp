import 'package:your_app_test/src/app/app_export.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image(
              image: const AssetImage(AssetsConstants.nbAuthLogo),
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 40),
            Text(
              StringConstants.forgotPassword,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(height: 20),
            Text(
              StringConstants.forgotPasswordDescription,
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
