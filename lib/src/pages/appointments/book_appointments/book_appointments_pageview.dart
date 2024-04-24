import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/appointments/book_appointments/components/book_appointments_body.dart';

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
