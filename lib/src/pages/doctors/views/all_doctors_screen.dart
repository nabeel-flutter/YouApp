import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: 'All Doctors',
      isBackAppBar: true,
      body: Column(
        children: [],
      ),
    );
  }
}
