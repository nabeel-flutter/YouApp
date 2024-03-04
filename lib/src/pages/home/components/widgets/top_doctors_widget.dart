import '../../../../app/app_export.dart';

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
