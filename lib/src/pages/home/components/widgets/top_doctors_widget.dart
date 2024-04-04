import 'package:new_beginnings/src/app/app_export.dart';

class TopDoctorsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? image;
  final String? description;
  const TopDoctorsWidget(
      {Key? key,
      this.title = "Dr Alexa Johnson",
      this.image,
      this.subtitle = "Cardiologist",
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.13,
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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      ColorConstants.grey, BlendMode.saturation),
                  child: Image.network(
                    image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10), // Add spacing between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.primaryTextColor,
                                fontSize: 16,
                              ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.primaryColor,
                            fontSize: 10,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.primaryTextColor,
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
