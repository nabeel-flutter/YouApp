import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/home/components/home_crousel.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Column(
              children: [HomeCarouselWidget()],
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
