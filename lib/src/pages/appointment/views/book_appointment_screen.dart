import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String preferredLocation = "Preferred Location For Service";
  String methodOfService = "Preferred Method Of Service";
  String technologyAvailable = "Type of Technology Available to You";
  String appointmentRequest = "Appointment Request";
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: const AppBarcomponent(
        isTitleTowLines: false,
        isBackAppBar: true,
        isGradient: true,
        title: "Book Appointment",
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40, bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            // context.router.push(const BookAppointmentRoute());
          },
          child: Text(
            'Done',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorConstants.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandedSelectionWidget(
                onTapped: (preferredLocation) {
                  setState(() {
                    this.preferredLocation = preferredLocation;
                  });
                },
                title: preferredLocation,
                label: "Preferred Location For Service",
                textList: const [
                  '1 W. Centre St Mahanoy, PA 17948',
                  '18151 W. End Ave Pottsville, PA 17901',
                  '564 Main St.Stroudsbrug, PA 18360',
                  '130 White Horse Pike Clementon, NJ 08021'
                ],
              ),
              ExpandedSelectionWidget(
                onTapped: (methodOfService) {
                  setState(() {
                    this.methodOfService = methodOfService;
                  });
                },
                title: methodOfService,
                label: "Please Select Your Preferred Method Of Service",
                textList: const [
                  'I would prefer on-site behavioral health services',
                  'I would prefer telehealth (remote) behavioral health services',
                  'I do not have preference for the type of behavioral health services I receive',
                ],
              ),
              ExpandedSelectionWidget(
                onTapped: (technologyAvailable) {
                  setState(() {
                    this.technologyAvailable = technologyAvailable;
                  });
                },
                title: technologyAvailable,
                label: "Please Select the type of Technology Available to you",
                textList: const [
                  'I have access to internet at my home or at an accessible location',
                  'I have a smart phone capable of adding the telehealth app for video conferencing',
                  'I do not have reliable internet or a smart phone',
                ],
              ),
              ExpandedSelectionWidget(
                onTapped: (appointmentRequest) {
                  setState(() {
                    this.appointmentRequest = appointmentRequest;
                  });
                },
                title: appointmentRequest,
                label: "Please Select Appointment Request",
                textList: const [
                  'I am a new patient requesting behavioral health services',
                  'I am referring a patient for behavioral health services',
                  'I am an existing patient requesting to schedule an appointment',
                  'I am an existing patient requesting to cancel and reschedule an appointment',
                  'I am an existing patient and have a medication related question or concern'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedSelectionWidget extends StatefulWidget {
  final String label;
  final List<String> textList;
  final String title;
  final Function(String) onTapped;
  const ExpandedSelectionWidget(
      {super.key,
      required this.label,
      required this.textList,
      required this.onTapped,
      required this.title});

  @override
  State<ExpandedSelectionWidget> createState() =>
      _ExpandedSelectionWidgetState();
}

class _ExpandedSelectionWidgetState extends State<ExpandedSelectionWidget> {
  bool expanded = false;

  ExpansionTileController expandedController = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorConstants.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.widgetBgColor.withOpacity(0.27),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: ColorConstants.primaryColor,
              ),
            ),
            child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: ColorConstants.white,
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorConstants.primaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                initiallyExpanded: false,
                controller: expandedController,
                onExpansionChanged: (expanded) {},
                children: [
                  ...widget.textList.map(
                    (location) => ListTile(
                      onTap: () {
                        widget.onTapped(location);
                        expandedController.collapse();
                      },
                      title: Text(
                        location,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ColorConstants.primaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}