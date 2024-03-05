import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/home/components/home_crousel.dart';
import 'package:new_beginnings/src/pages/home/components/widgets/top_services_widget.dart';

import 'package:new_beginnings/src/pages/home/components/widgets/body_heading.dart';
import 'package:new_beginnings/src/pages/home/components/widgets/top_doctors_widget.dart';

import 'package:new_beginnings/src/pages/all_services/models/services_model.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Service> services = [
      Service(
          name: "Psychiatric\nEvaluation", image: AssetsConstants.pscyEvImage),
      Service(name: "Group Therapy", image: AssetsConstants.pscyEvImage),
      Service(
          name: "Medication\nManagement", image: AssetsConstants.pscyEvImage),
    ];
    return MainScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                const HomeCarouselWidget(),
                BodyHeading(
                  title: "Top Services",
                  onTap: () {
                    context.router.push(const AllServicesRoute());
                  },
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...services.map((e) => TopServicesWidget(
                            title: e.name,
                            image: e.image!,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BodyHeading(
                  title: "Top Doctors",
                  onTap: () {
                    context.router.push(const AllDoctorsRoute());
                  },
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    ...List.generate(3, (index) => const TopDoctorsWidget())
                  ],
                )
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
