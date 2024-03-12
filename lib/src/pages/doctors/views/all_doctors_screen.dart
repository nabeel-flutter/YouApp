import 'package:new_beginnings/src/app/app_export.dart';

import 'package:new_beginnings/src/pages/home/components/widgets/top_doctors_widget.dart';
import 'package:new_beginnings/src/pages/doctors/cubit/cubit/doctors_cubit.dart';

@RoutePage()
class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({Key? key}) : super(key: key);

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  String specialty = 'All';

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
        appbarText: 'All Doctors',
        isBackAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(children: [
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: context
                      .read<DoctorsCubit>()
                      .specaialty
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: FilterChip(
                              side: const BorderSide(
                                  color: ColorConstants.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: specialty == e
                                  ? ColorConstants.primaryTextColor
                                  : ColorConstants.white,
                              label: Text(e,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: specialty == e
                                            ? ColorConstants.white
                                            : ColorConstants.primaryTextColor,
                                      )),
                              onSelected: (bool value) {
                                setState(() {
                                  specialty = e;
                                });
                                BlocProvider.of<DoctorsCubit>(context)
                                    .filterDoctorsBySpecialty(e);
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: specialty == 'All'
                    ? context
                        .read<DoctorsCubit>()
                        .doctors
                        .map((e) => GestureDetector(
                              onTap: () {
                                context.router.push(
                                  DoctorProfileRoute(doctor: e),
                                );
                              },
                              child: TopDoctorsWidget(
                                title: e.name,
                                subtitle: e.specialty,
                                image: e.image,
                                description: e.description,
                              ),
                            ))
                        .toList()
                    : context
                        .read<DoctorsCubit>()
                        .doctors
                        .where((element) => element.department == specialty)
                        .map((e) => GestureDetector(
                              onTap: () {
                                context.router.push(
                                  DoctorProfileRoute(doctor: e),
                                );
                              },
                              child: TopDoctorsWidget(
                                title: e.name,
                                subtitle: e.specialty,
                                image: e.image,
                                description: e.description,
                              ),
                            ))
                        .toList(),
              ),
            ]),
          ),
        ));
  }
}
