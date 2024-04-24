import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/doctors/models/department_dto.dart';

class DescriptionWidget extends StatelessWidget {
  final Team doctor;
  const DescriptionWidget({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.aboutMe,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorConstants.primaryTextColor,
                fontSize: 16,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          doctor.description.toString(),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstants.grey,
                fontSize: 14,
              ),
        ),
      ],
    );
  }
}
