import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/core/date_time.dart';
import 'package:new_beginnings/src/pages/appointment/cubit/appointnent_details/appointment_cubit_cubit.dart';
import 'package:new_beginnings/src/pages/appointment/views/widgets/input_initial_payment.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/select_date_widget.dart';
import 'package:new_beginnings/src/pages/appointment/views/widgets/select_time_widget.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/payment_mode_selection.dart';
import 'package:new_beginnings/src/pages/profile/widgets/custom_textfeild_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:new_beginnings/src/pages/appointment/views/widgets/expanded_selection_widget.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  AppointmentDetailsDto? _appointmentDetails;

  Service? _selectedService;

  Slot? _selectedTimeSlot;

  String? _selectedTime;

  DateTime? _selectedDate;

  bool _showNumericField = false;

  final TextEditingController _controller = TextEditingController();

  Slot? initialSlot;

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
                '9:30 AM',
                '10:00 AM',
                '10:30 PM',
                '11:00 AM',
                '11:30 AM',
                '12:00 PM',
                '12:30 PM',
                '1:00 PM',
                '1:30 PM',
                '2:00 PM',
                '2:30 PM',
                '3:00 PM',
                '3:30 PM',
                '4:00 PM',
                '4:30 PM',
                '5:00 PM',
                '5:30 PM',
              ],
              onSelectedTime: appointmentCubit.selectTime,
            ),
            const SizedBox(height: 20),
            BlocConsumer<AppointmentCubit, AppointmentCubitState>(
              listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                selectedDate: (selectedDate) => _selectedDate = selectedDate,
                selectedService: (selectedService) {
                  _selectedTimeSlot = null;
                  return _selectedService = _appointmentDetails!.services
                      .firstWhere((element) => element.name == selectedService);
                },
                selectedTimeSlot: (selectedTimeSlot) => _selectedTimeSlot =
                    _selectedService!.slots.firstWhere(
                        (element) => element.time == selectedTimeSlot),
                selectedTime: (selectedTime) => _selectedTime = selectedTime,
                loaded: (appointmentDetails) {
                  _selectedService = null;
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
                          if (_appointmentDetails?.paymentType ==
                              'insured') ...{
                            InputInitialPayment(
                              onValueChanged: (value) {
                                setState(() {
                                  _showNumericField = value == 1;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                          },
                          if (_showNumericField) ...{
                            CustomTextField(
                                keyboardType: TextInputType.number,
                                fieldName: "Initial Amount",
                                hintText: "Enter your amount",
                                controller: _controller),
                            const SizedBox(height: 10),
                          },
                          ExpandedSelectionWidget(
                            label: "Service",
                            textList: _appointmentDetails!.services
                                .map((e) => e.name)
                                .toList(),
                            onTapped: (p0) {
                              appointmentCubit.selectService(p0);
                            },
                            title: _selectedService != null
                                ? _selectedService!.name
                                : "Tap to select",
                          ),
                          if (_selectedService != null)
                            _selectedService!.slots.length > 1
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
                int? initialAmount = int.tryParse(
                    _controller.text.isNotEmpty ? _controller.text : '0');
                if (_selectedDate == null) {
                  ToastComponent3(context)
                      .showToast(context, 'Please select date');
                } else if (_selectedService == null) {
                  ToastComponent3(context)
                      .showToast(context, 'Please select service');
                } else if (_selectedService!.slots.length > 1 &&
                    _selectedTimeSlot == null) {
                  ToastComponent3(context)
                      .showToast(context, 'Please select time slot');
                } else if (_selectedTime == null) {
                  ToastComponent3(context).showToast(
                      context, 'Please select preferred appointment time');
                } else if (initialAmount == null &&
                    _appointmentDetails!.paymentType != 'selfPay') {
                  ToastComponent3(context).showToast(
                    context,
                    'Initial amount can not be empty',
                  );
                } else if (initialAmount! < 1 && _showNumericField == true) {
                  ToastComponent3(context).showToast(
                    context,
                    'Initial amount must be more than \$0.00.',
                  );
                } else {
                  if (initialAmount > 1) {
                    initialSlot = Slot(
                        id: _selectedTimeSlot != null
                            ? _selectedTimeSlot!.id
                            : _selectedService!.id,
                        price: initialAmount,
                        time: _selectedTimeSlot != null
                            ? _selectedTimeSlot!.time
                            : 'N/A');
                  }
                  context.router.push(BookAppointmentRoute(
                      initialPayment: _showNumericField,
                      initialAmount: initialAmount,
                      service: _selectedService!,
                      slot: initialSlot ?? _selectedTimeSlot,
                      paymentMethod: _appointmentDetails!.paymentType,
                      date: _selectedDate.toString().substring(0, 10),
                      time: DateTimeUtil()
                          .convertTo24HourFormat(_selectedTime!)));
                }
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
