import 'package:your_app_test/src/app/app_export.dart';

class ServiceTopWidget extends StatelessWidget {
  final String image;
  final String? title;
  final String? heading;
  final String? description;
  const ServiceTopWidget({
    super.key,
    this.title,
    this.image = AssetsConstants.pscyEvImage,
    this.heading,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Divider(
              color: ColorConstants.yellowGolden,
              thickness: 3,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          heading!,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 20),
        Text(description!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ))
      ],
    );
  }
}
