import 'package:new_beginnings/src/app/app_export.dart';

class TopServicesWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final VoidCallback? onTap;

  const TopServicesWidget(
      {super.key,
      this.title = "Psychiatric Evaluation",
      this.onTap,
      this.subTitle = "Cardiologist",
      this.image = AssetsConstants.pscyEvImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorConstants.primaryColor,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
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
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          color: ColorConstants.primaryTextColor,
                          fontSize: 16,
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
