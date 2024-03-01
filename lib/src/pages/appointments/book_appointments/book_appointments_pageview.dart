import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/appointments/book_appointments/components/book_appointments_body.dart';

class BookAppointmentsPageView extends StatelessWidget {
  const BookAppointmentsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BookAppointmentsBody(),
        ),
        // SlideActionBtn(),
      ],
    );
  }
}
