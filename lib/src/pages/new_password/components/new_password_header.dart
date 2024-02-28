import 'package:new_beginnings/src/app/app_export.dart';

class NewPasswordHeader extends StatelessWidget {
  const NewPasswordHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Image(
            image: const AssetImage(AssetsConstants.nbAuthLogo),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Create New Password',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(height: 20),
          Text(
            'Please create new password',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorConstants.subTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
