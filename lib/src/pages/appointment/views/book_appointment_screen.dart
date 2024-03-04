
import 'package:new_beginnings/src/app/app_export.dart';
@RoutePage()
class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  PrimaryBackground(
      appbarText: StringConstants.bookAppointment,
      isBackAppBar: true,
      body: Column(),
    );
  }
}