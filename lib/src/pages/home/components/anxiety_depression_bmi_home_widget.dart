import 'package:new_beginnings/src/app/app_export.dart';

class AnxietyDepressionBmiHomeWidget extends StatelessWidget {
  const AnxietyDepressionBmiHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(children: [
        AnxietyDepressionHomeWidget(),
        SizedBox(width: 5),
        BmiHomeWidget(),
      ]),
    );
  }
}
