import 'package:new_beginnings/src/app/app_export.dart';

class ResultIdentifiedRow extends StatelessWidget {
  const ResultIdentifiedRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConstants.result,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontFamily: FontConstants.gilroySemiBold),
          ),
          Text(
            StringConstants.identified,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: FontConstants.gilroySemiBold,
                color: ColorConstants.green),
          ),
        ],
      ),
    );
  }
}
