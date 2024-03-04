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

class TopServicesWidget extends StatelessWidget {
  const TopServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstants.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 19,
            offset: const Offset(4, 8), // changes position of shadow
          ),
        ],
        color: ColorConstants.white.withOpacity(0.65),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AssetsConstants.doctorDetailImage,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Psychiatrist Evaluation",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.primaryTextColor,
                  fontSize: 16,
                ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "A comprehensive psychiatric evaluation is essential for diagnosing a spectrum of emotional.",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.primaryTextColor,
                    fontSize: 10,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopDoctorsWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final VoidCallback? onTap;

  const TopDoctorsWidget(
      {super.key,
      this.title = "Dr. Alexa Doe",
      this.onTap,
      this.subTitle = "Cardiologist",
      this.image = AssetsConstants.doctorImageHomePage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorConstants.primaryColor,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border: const Border(
                  bottom: BorderSide(
                    color: ColorConstants.primaryColor,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primaryTextColor,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primaryTextColor,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyHeading extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const BodyHeading({
    super.key,
    this.title = "title",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ColorConstants.primaryColor,
                )),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text("See All",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorConstants.primaryColor,
                  )),
        ),
      ],
    );
  }
}
