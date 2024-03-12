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
              timeOptions: const [
                '9:00 AM',
                '10:00 AM',
                '11:00 AM',
                '12:00 PM',
              ],
              onSelectedTime: appointmentCubit.selectTime,
            ),
            const SizedBox(height: 20),
            PaymentModeSelection(
              onValueChanged: (value) {
                appointmentCubit.selectPaymentMode(value);
              },
            ),
            const SizedBox(height: 20),
            ExpandedSelectionWidget(
                label: "Services",
                textList: appointmentCubit.servicesList,
                onTapped: (p0) {
                  appointmentCubit.selectService(p0);
                  setState(() {});
                },
                title: appointmentCubit.service),
            appointmentCubit.service == "Individual Counseling"
                ? ExpandedSelectionWidget(
                    label: "Timeslot",
                    textList: appointmentCubit.timeSlotList,
                    onTapped: (p0) {
                      appointmentCubit.selectTimeSlot(p0);
                      setState(() {});
                    },
                    title: appointmentCubit.timeSlot)
                : Container(),
            const SizedBox(height: 20),
            BlocBuilder<AppointmentCubit, AppointmentCubitState>(
                builder: (context, state) => state.maybeWhen(
                      orElse: () => ElevatedButton(
                        onPressed: () {
                          // appointmentCubit.bookAppointment(
                          //   selectedPaymentMode:
                          //       appointmentCubit.selectedPaymentMode,
                          //   selectedDate: appointmentCubit.selectedDate1,
                          //   selectedTime: appointmentCubit.selectedTime1,
                          //   selectedService: appointmentCubit.service,
                          //   selectedTimeSlot: appointmentCubit.service ==
                          //           "Individual Counseling"
                          //       ? appointmentCubit.timeSlot
                          //       : null,
                          // );
                          context.router.push(const BookAppointmentRoute());
                        },
                        child: Text(
                          StringConstants.next,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorConstants.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
