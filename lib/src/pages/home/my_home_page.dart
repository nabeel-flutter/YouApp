import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return flavorBanner(
      show: true,
      child: const HomeScreenBody(),
    );
  }
}
