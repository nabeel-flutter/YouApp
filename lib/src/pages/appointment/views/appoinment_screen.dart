import 'package:new_beginnings/src/app/app_export.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/select_date_widget.dart';
import 'package:new_beginnings/src/pages/appointment/views/widgets/select_time_widget.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/payment_mode_selection.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    final appointmentCubit = context.read<AppointmentCubit>();
    return PrimaryBackground(
      appbarText: StringConstants.bookAppointment,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          children: [
            SelectDateWidget(
              onDateSelected: appointmentCubit.selectDate,
            ),
            const SizedBox(height: 20),
            SelectTimeWidget(
              onSelectedTime: appointmentCubit.selectTime,
            ),
            const SizedBox(height: 20),
            const PaymentModeSelection(),
            const SizedBox(height: 20),
            ExpandedSelectionWidget(
              label: "Preferred Method For Service",
              textList: appointmentCubit.reasonForAppointmentList,
              onTapped: (p0) {
                appointmentCubit.selectReasonForAppointment(p0);
                setState(() {});
              },
              title: appointmentCubit.reasonForAppointment,
            ),
            appointmentCubit.reasonForAppointment ==
                    'I Need Primary Care Service'
                ? const ModeOfAppointment()
                : Container(),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  context.router.push(const BookAppointmentRoute());
                },
                child: Text(
                  StringConstants.next,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                ))
          ],
        ),
      ),
    );
  }
}
