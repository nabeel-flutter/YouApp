import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/home/components/home_crousel.dart';
import 'package:new_beginnings/src/pages/home/components/widgets/top_doctors_widget.dart';

import 'package:new_beginnings/src/pages/home/components/widgets/body_heading.dart';
import 'package:new_beginnings/src/pages/home/components/widgets/top_services_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                const HomeCarouselWidget(),
                BodyHeading(
                  title: "Top Doctors",
                  onTap: () {
                    context.router.push(const AllDoctorsRoute());
                  },
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(3, (index) => const TopDoctorsWidget()),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BodyHeading(
                  title: "Top Services",
                  onTap: () {
                    context.router.push(const AllServicesRoute());
                  },
                ),
                const SizedBox(height: 10),
                const Column(
                  children: [TopServicesWidget()],
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
