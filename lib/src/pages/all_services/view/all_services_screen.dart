import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      body: Column(),
      appbarText: 'All Services',
      isBackAppBar: true,
    );
  }
}
