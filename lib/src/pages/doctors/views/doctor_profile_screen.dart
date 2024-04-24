import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/doctors/views/widgets/description_widget.dart';

import 'package:your_app_test/src/pages/doctors/views/widgets/doctor_statistics_widget.dart';

@RoutePage()
class DoctorProfileScreen extends StatelessWidget {
  final Team doctor;
  final String department;
  const DoctorProfileScreen(
      {super.key, required this.doctor, required this.department});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      isAppBar: true,
      appbarText: department,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              //top doctor widget
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstants.primaryTextColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  color: ColorConstants.white,
                  // border: Border.all(color: ColorConstants.primaryTextColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //add image with color filter
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        child: Image.network(
                          doctor.profile!,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.error,
                                color: ColorConstants.primaryTextColor,
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                doctor.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstants.primaryTextColor,
                                      fontSize: 16,
                                    ),
                              ),
                              const Spacer(),
                              department == "Providers"
                                  ? Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: ColorConstants.yellowGolden,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          doctor.ratings.toString() +
                                              " " +
                                              '(' +
                                              doctor.reviews.toString() +
                                              " Reviews" +
                                              ')',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: ColorConstants.black,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            doctor.designation!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: ColorConstants.grey,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //statistics widget
              const SizedBox(height: 20),
              department == "Providers"
                  ? StatisticsWidget(
                      doctor: doctor,
                    )
                  : Container(),
              //about doctor
              const SizedBox(height: 20),
              DescriptionWidget(
                doctor: doctor,
              ),
            ],
          ),
        ),
      ),
      isBackAppBar: true,
    );
  }
}
