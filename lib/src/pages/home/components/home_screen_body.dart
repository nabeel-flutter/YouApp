import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/home/components/home_crousel.dart';
import 'package:your_app_test/src/pages/home/components/widgets/top_services_widget.dart';

import 'package:your_app_test/src/pages/home/components/widgets/body_heading.dart';
import 'package:your_app_test/src/pages/home/components/widgets/top_doctors_widget.dart';

import 'package:your_app_test/src/pages/doctors/cubit/cubit/doctors_cubit.dart';

import 'package:your_app_test/src/pages/all_services/cubit/cubit/service_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DoctorsCubit>(context).getTeam();
    // List<ServiceModel> services = [
    //   ServiceModel(
    //       name: "Psychiatric\nEvaluation", image: AssetsConstants.pscyEvImage),
    //   ServiceModel(name: "Group Therapy", image: AssetsConstants.pscyEvImage),
    //   ServiceModel(
    //       name: "Medication\nManagement", image: AssetsConstants.pscyEvImage),
    // ];
    return MainScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                const HomeCarouselWidget(),
                BodyHeading(
                  title: "Services",
                  onTap: () {
                    context.router.push(const AllServicesRoute());
                  },
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: BlocProvider.of<ServiceCubit>(context)
                        .services
                        .map((e) => GestureDetector(
                              onTap: () {
                                if (e.name == "Psychiatric\nEvaluation") {
                                  context.router.push(
                                    ServiceInnerRoute(service: e),
                                  );
                                }
                                if (e.name == "Group Therapy") {
                                  debugPrint("Group Therapy");
                                  context.router.push(
                                    const GTRoute(),
                                  );
                                }
                                if (e.name == "Medication\nManagement") {
                                  context.router.push(
                                    const MMRoute(),
                                  );
                                }
                                if (e.name == "Play Therapy") {
                                  context.router.push(
                                    const PTRoute(),
                                  );
                                }
                                if (e.name == "Individual Therapy") {
                                  context.router.push(
                                    const IDRoute(),
                                  );
                                }
                                if (e.name == "Couple & Family Therapy") {
                                  context.router.push(
                                    const CPTRoute(),
                                  );
                                }
                                if (e.name == "Pharmacogenomics") {
                                  context.router.push(
                                    const PMRoute(),
                                  );
                                }
                                if (e.name == "Addiction Treatment") {
                                  context.router.push(
                                    const ATRoute(),
                                  );
                                }
                                if (e.name == "Telepsychiatry") {
                                  context.router.push(
                                    const TPRoute(),
                                  );
                                }
                                if (e.name == "Primary Care") {
                                  context.router.push(
                                    const PCRoute(),
                                  );
                                }
                              },
                              child: TopServicesWidget(
                                title: e.name,
                                image: e.image!,
                              ),
                            ))
                        .toList()
                        .sublist(0, 5),
                  ),
                ),
                const SizedBox(height: 20),
                BodyHeading(
                  title: "Team Members",
                  onTap: () {
                    context.router.push(const AllDoctorsRoute());
                  },
                ),
                const SizedBox(height: 10),
                BlocBuilder<DoctorsCubit, DoctorsState>(
                  builder: (context, state) => state.maybeWhen(
                    orElse: () => const Center(
                      child: Text('No Team member is available'),
                    ),
                    Error: (message) => ErrorState(
                      message: message,
                      onTap: () => context.read<DoctorsCubit>().getTeam(),
                    ),
                    loading: () {
                      return Skeletonizer(
                        child: Column(
                          children: List.generate(5, (index) {
                            return const TopDoctorsWidget(
                              title: "",
                              subtitle: "",
                              image: "",
                              description: "",
                            );
                          }),
                        ),
                      );
                    },
                    loaded: (team) => Column(
                      children: team.data.where((element) => element.department=='Executive Management')
                          .map((e) => Column(
                                children: e.team
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            context.router.push(
                                                DoctorProfileRoute(
                                                    doctor: e,
                                                    department:
                                                        e.department ?? ""));
                                          },
                                          child: TopDoctorsWidget(
                                            image: e.image ?? "",
                                            description: e.description ?? "",
                                            subtitle: e.designation ?? "",
                                            title: e.name ?? "",
                                          ),
                                        ))
                                    .toList(),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                //     Column(
                //         children: BlocProvider.of<DoctorsCubit>(context)
                //             .doctors
                //             .map((e) => GestureDetector(
                //                   onTap: () {
                //                     context.router.push(
                //                       DoctorProfileRoute(doctor: e,
                //                       department: e.specialty
                //                       ),
                //                     );
                //                   },
                //                   child: TopDoctorsWidget(
                //                     title: e.name,
                //                     subtitle: e.specialty,
                //                     image: e.image,
                //                     description: e.description,
                //                   ),
                //                 ))
                //             .toList()
                //             .sublist(0, 5)),
              ],
            ),
          ),
        ),
        isGradient: false,
        appBar: AppBarcomponent(
            isTitleTowLines: true,
            isGradient: false,
            title: StringConstants.home,
            isBackAppBar: false));
  }
}
