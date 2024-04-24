import 'package:your_app_test/src/app/app_export.dart';

class ServiceInfoCard extends StatelessWidget {
  final String title;
  final String description;
  const ServiceInfoCard(
      {super.key,
      this.title = "Who is evaluated?",
      this.description =
          "The evaluation process is tailored to the individual"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: ColorConstants.widgetBgColor),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w400, height: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
              top: -20,
              left: -20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const Image(
                    image: AssetImage(AssetsConstants.stackPattern1)),
              )),
          Positioned(
              bottom: -20,
              right: -20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const Image(
                    image: AssetImage(AssetsConstants.stackPattern2)),
              )),
        ],
      ),
    );
  }
}
