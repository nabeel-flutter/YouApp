import 'package:new_beginnings/src/app/app_export.dart';
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

