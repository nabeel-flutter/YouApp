import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/doctors/views/widgets/description_widget.dart';

import 'package:new_beginnings/src/pages/doctors/views/widgets/doctor_statistics_widget.dart';

@RoutePage()
class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorProfileScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      isAppBar: true,
      appbarText: doctor.department,
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
                      color: ColorConstants.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: AssetImage(doctor.image),
                          fit: BoxFit.fill,
                        ),
                      )),
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
                                doctor.name,
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
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: ColorConstants.yellowGolden,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    doctor.rating.toString() +
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            doctor.specialty,
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
              StatisticsWidget(
                doctor: doctor,
              ),
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
