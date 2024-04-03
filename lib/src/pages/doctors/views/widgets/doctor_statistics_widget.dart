import 'package:new_beginnings/src/app/app_export.dart';

class StatisticsWidget extends StatelessWidget {
  final Doctor doctor;
  const StatisticsWidget({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StatisticIcon(
          icon: AssetsConstants.noOfPatientsIcon,
          title: "${doctor.noOfPatients}+",
          subtitle: StringConstants.patients,
        ),
        StatisticIcon(
          icon: AssetsConstants.yearsOfExperienceIcon,
          title: "${doctor.yearsOfExperience}+ years",
          subtitle: "Experience",
        ),
        StatisticIcon(
          icon: AssetsConstants.ratingIconDoctor,
          title: doctor.rating.toString(),
          subtitle: StringConstants.rating,
        ),
        StatisticIcon(
          icon: AssetsConstants.reviewsIcon,
          title: "${doctor.reviews}+",
          subtitle: StringConstants.reviews,
        )
      ],
    );
  }
}

class StatisticIcon extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const StatisticIcon({
    super.key,
    this.icon = AssetsConstants.noOfPatientsIcon,
    required this.title,
    this.subtitle = "patients",
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(icon),
      const SizedBox(height: 10),
      Text(title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorConstants.primaryTextColor,
                fontSize: 16,
              )),
      const SizedBox(height: 5),
      Text(subtitle,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorConstants.grey,
                fontSize: 14,
              )),
    ]);
  }
}
