import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/appointment/cubit/book_appointment/cubit/book_appointment_cubit.dart';
import 'package:your_app_test/src/pages/appointment/views/widgets/expanded_selection_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen(
      {super.key,
      this.slot,
      required this.service,
      required this.paymentMethod,
      required this.date,
      required this.time,
      this.initialAmount,required this.initialPayment});
  final Slot? slot;
  final Service service;
  final String paymentMethod;
  final String date;
  final String time;
  final int? initialAmount;
  final bool  initialPayment;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? _methodOfService;
  String? _technologyAvailable;
  String? _appointmentRequest;

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.date);
    return MainScaffold(
      appBar: const AppBarcomponent(
        isTitleTowLines: false,
        isBackAppBar: true,
        isGradient: true,
        title: "Book Appointment",
      ),
      body: BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => Container(),
            loading: () => null,
            loaded: (data) async {
              if (data.data['paymentLink'] == null) {
                AlertDialogComponent.showDialogComponent(
                  alertDialog: const AlertDialog(
                    insetPadding: EdgeInsets.all(16),
                    contentPadding: EdgeInsets.zero,
                    content: SuccessDialog(
                      isInsured: true,
                    ),
                  ),
                  context: context,
                );
              } else {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PaymentWebViewScreen(uri: data.data['paymentLink']),
                ));
              }
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) => state.maybeWhen(
          loading: () => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Skeletonizer(
                    child: Column(
                      children: [
                        ExpandedSelectionWidget(
                          onTapped: (methodOfService) {
                            setState(() {
                              _methodOfService = methodOfService;
                              if (methodOfService == 'On-site (face-to-face)') {
                                _technologyAvailable = null;
                              }
                            });
                          },
                          title:
                              _methodOfService ?? "Preferred Method Of Service",
                          label:
                              "Please Select Your Preferred Method Of Service",
                          textList: const [
                            'On-site (face-to-face)',
                            'Telehealth (remote)',
                            'Any available method (No preference)',
                          ],
                        ),
                        if (_methodOfService != 'On-site (face-to-face)')
                          ExpandedSelectionWidget(
                            onTapped: (technologyAvailable) {
                              setState(() {
                                _technologyAvailable = technologyAvailable;
                              });
                            },
                            title: _technologyAvailable ??
                                "Type of Technology Available",
                            label:
                                "Please Select the type of Technology Available to you",
                            textList: const [
                              'I have access to internet at my home or at an accessible location',
                              'I have a smart phone capable of adding the telehealth app for video conferencing',
                              'I do not have reliable internet or a smart phone',
                            ],
                          ),
                        ExpandedSelectionWidget(
                          onTapped: (appointmentRequest) {
                            setState(() {
                              _appointmentRequest = appointmentRequest;
                            });
                          },
                          title: _appointmentRequest ?? "Appointment Request",
                          label: "Please Select Appointment Request",
                          textList: const [
                            'I am a new patient requesting behavioral health services',
                            'I am referring a patient for behavioral health services',
                            'I am an existing patient requesting to schedule an appointment',
                            'I am an existing patient requesting to cancel and reschedule an appointment',
                            'I am an existing patient and have a medication related question or concern'
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Loading...",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: ColorConstants.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: AppProgressIndicator(
                              color: ColorConstants.white,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
          orElse: () => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpandedSelectionWidget(
                    onTapped: (methodOfService) {
                      setState(() {
                        _methodOfService = methodOfService;
                        if (methodOfService == 'On-site (face-to-face)') {
                          _technologyAvailable = null;
                        }
                      });
                    },
                    title: _methodOfService ?? "Preferred Method Of Service",
                    label: "Please Select Your Preferred Method Of Service",
                    textList: const [
                      'On-site (face-to-face)',
                      'Telehealth (remote)',
                      'Any available method (No preference)',
                    ],
                  ),
                  if (_methodOfService != 'On-site (face-to-face)')
                    ExpandedSelectionWidget(
                      onTapped: (technologyAvailable) {
                        setState(() {
                          _technologyAvailable = technologyAvailable;
                        });
                      },
                      title: _technologyAvailable ??
                          "Type of Technology Available",
                      label:
                          "Please Select the type of Technology Available to you",
                      textList: const [
                        'I have access to internet at my home or at an accessible location',
                        'I have a smart phone capable of adding the telehealth app for video conferencing',
                        'I do not have reliable internet or a smart phone',
                      ],
                    ),
                  ExpandedSelectionWidget(
                    hasOtherOption: true,
                    onTapped: (appointmentRequest) {
                      setState(() {
                        _appointmentRequest = appointmentRequest;
                      });
                    },
                    title: _appointmentRequest ?? "Appointment Request",
                    label: "Please Select Appointment Request",
                    textList: const [
                      'I am a new patient requesting behavioral health services',
                      'I am referring a patient for behavioral health services',
                      'I am an existing patient requesting to schedule an appointment',
                      'I am an existing patient requesting to cancel and reschedule an appointment',
                      'I am an existing patient and have a medication related question or concern',
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      child: Text("Done",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                      onPressed: () {
                        print(widget.initialAmount);
                        if (_methodOfService == null) {
                          ToastComponent3(context).showToast(
                              context, 'Please select method of service');
                        } else if (_methodOfService !=
                                'On-site (face-to-face)' &&
                            _technologyAvailable == null) {
                          ToastComponent3(context).showToast(
                              context, 'Please select technology available');
                        } else if (_appointmentRequest == null) {
                          ToastComponent3(context).showToast(
                              context, 'Please select appointment request');
                        } else {
                          context.read<BookAppointmentCubit>().bookAppointment(
                            initialPayment : widget. initialPayment,
                                serviceName: widget.service.name,
                                timeSlot: widget.slot != null
                                    ? widget.slot!.time
                                    : "Not Available",
                                date: "${widget.date}T${widget.time}",
                                paymentType: widget.paymentMethod,
                                price: widget.slot != null
                                    ? widget.slot!.price
                                    : widget.service.slots.first.price,
                                method: _methodOfService ?? "No Preference",
                                technologyType:
                                    _technologyAvailable ?? "No Preference",
                                requestType:
                                    _appointmentRequest ?? "No Preference",
                              );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
