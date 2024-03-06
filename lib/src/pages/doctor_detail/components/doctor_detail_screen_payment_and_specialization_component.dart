import 'package:new_beginnings/src/app/app_export.dart';

class DoctorDetailScreenPaymentAndSpecialization extends StatelessWidget {
  const DoctorDetailScreenPaymentAndSpecialization({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorDetailHeadingTwo(
            color: getThemeStateIsLight()
                ? lighten(getThemeColor(context), 0.35)
                : darken(getThemeColor(context), 0.35),
            text: 'General Physician'),
        const Row(
          children: [
            DoctorDetailHeadingOne(
                fontFamily: FontConstants.gilroySemiBold,
                heading: '\$39',
                headingColor: ColorConstants.greenIndicatorColor),
            DoctorDetailHeadingOne(
                fontFamily: FontConstants.gilroyRegular,
                heading: '/h',
                headingColor: ColorConstants.greenIndicatorColor),
          ],
        )
      ],
    );
  }
}
