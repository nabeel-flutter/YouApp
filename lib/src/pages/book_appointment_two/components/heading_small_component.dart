import 'package:new_beginnings/src/app/app_export.dart';

class HeadingSmall extends StatelessWidget {
  const HeadingSmall({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontFamily: FontConstants.gilroyMedium));
  }
}
