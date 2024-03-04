import '../../../../app/app_export.dart';

class BodyHeading extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const BodyHeading({
    super.key,
    this.title = "title",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ColorConstants.primaryColor,
                )),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text("See All",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorConstants.primaryColor,
                  )),
        ),
      ],
    );
  }
}
