import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/appointments/components/appointments_body.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: StringConstants.appointments,
      isBackAppBar: false,
      body: const AppointmentsBody(),
    );
  }
}
