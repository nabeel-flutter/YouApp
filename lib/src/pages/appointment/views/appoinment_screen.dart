import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/appointment/models/appointments_details_dto.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/select_date_widget.dart';
import 'package:new_beginnings/src/pages/appointment/views/widgets/select_time_widget.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/payment_mode_selection.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  AppointmentDetailsDto? _appointmentDetails;

  Service? _selectedService;

  Slot? _selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = context.read<AppointmentCubit>();
    appointmentCubit.getAppointmentDetails();
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
            BlocConsumer<AppointmentCubit, AppointmentCubitState>(
              listener: (context, state) => state.maybeWhen(
                orElse: () {
                  return null;
                },
                selectedService: (selectedService) {
                  _selectedTimeSlot = null;
                  return _selectedService = _appointmentDetails!.services
                      .firstWhere((element) => element.name == selectedService);
                },
                selectedTimeSlot: (selectedTimeSlot) => _selectedTimeSlot =
                    _selectedService!.slots.firstWhere(
                        (element) => element.time == selectedTimeSlot),
                loaded: (appointmentDetails) {
                  return _appointmentDetails = appointmentDetails;
                },
                error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                ),
              ),
              builder: (context, state) {
                return _appointmentDetails != null
                    ? Column(
                        children: [
                          Stack(
                            children: [
                              PaymentModeSelection(
                                onValueChanged: (value) {
                                  _appointmentDetails!.paymentType == 'selfPay'
                                      ? appointmentCubit.selectPaymentMode(1)
                                      : appointmentCubit.selectPaymentMode(2);
                                },
                                initialSelectedValue:
                                    _appointmentDetails!.paymentType ==
                                            'selfPay'
                                        ? 2
                                        : 1,
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ExpandedSelectionWidget(
                            label: "Service",
                            textList: _appointmentDetails!.services
                                .map((e) => e.name)
                                .toList(),
                            onTapped: (p0) {
                              appointmentCubit.selectService(p0);
                            },
                            title: appointmentCubit.service,
                          ),
                          if (_selectedService != null)
                            _selectedService!.slots.length != 1
                                ? ExpandedSelectionWidget(
                                    label: "Timeslot",
                                    textList: _selectedService!.slots
                                        .map((e) => e.time)
                                        .toList(),
                                    onTapped: (p0) {
                                      appointmentCubit.selectTimeSlot(p0);
                                    },
                                    title: _selectedTimeSlot != null
                                        ? _selectedTimeSlot!.time
                                        : 'Tap to select',
                                  )
                                : Container()
                        ],
                      )
                    : Skeletonizer(
                        child: Column(
                          children: [
                            ExpandedSelectionWidget(
                              label: "Service",
                              textList: List.generate(3, (index) => ''),
                              onTapped: (p0) {},
                              title: '',
                            ),
                            ExpandedSelectionWidget(
                              label: "Timeslot",
                              textList: List.generate(3, (index) => ''),
                              onTapped: (p0) {},
                              title: '',
                            ),
                          ],
                        ),
                      );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorConstants.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
