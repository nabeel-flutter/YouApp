import 'package:your_app_test/src/app/app_export.dart';

import 'package:your_app_test/src/pages/home/components/widgets/top_doctors_widget.dart';
import 'package:your_app_test/src/pages/doctors/cubit/cubit/doctors_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    BlocProvider.of<DoctorsCubit>(context).getTeam();
    return PrimaryBackground(
        appbarText: specialty == "All" ? "Team Members" : specialty,
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
                                    .getTeam();
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) => state.maybeWhen(
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  Error: (message) => ErrorState(
                    message: message,
                    onTap: () => context.read<DoctorsCubit>().getTeam(),
                  ),
                  loading: () => Skeletonizer(
                    child: Column(
                      children: List.generate(8, (index) {
                        return const TopDoctorsWidget(
                          title: "",
                          subtitle: "",
                          image: "",
                          description: "",
                        );
                      }),
                    ),
                  ),
                  loaded: (team) => Column(
                    children: team.data
                        .where((element) =>
                            specialty == "All" ||
                            element.department == specialty)
                        .map((e) => Column(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 10.0),
                                //   child: Text(
                                //     e.department,
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyLarge!
                                //         .copyWith(
                                //             color: ColorConstants.primaryColor,
                                //             fontFamily: FontConstants.gilroyBold),
                                //   ),
                                // ),
                                Column(
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
                                ),
                              ],
                            ))
                        .toList(),
                    // children:
                    // [Text(team.toString())]

                    // children: team
                    //     .where((element) =>
                    //         specialty == "All" || element.specialty == specialty)
                    //     .map((e) => TopDoctorsWidget(

                    //           doctor: e,
                    //         ))
                    //     .toList(),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
