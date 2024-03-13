import 'package:new_beginnings/src/app/app_export.dart';

@RoutePage()
class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key, 
   this.slot, required this.service, required this.paymentMethod, required this.date, required this.time});
  final Slot? slot;
  final Service service;
  final String paymentMethod;
  final String date ;
  final String time ;



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
              widget.slot!=null? Text(widget.slot!.price.toString()):
              Text(widget.service.slots.first.price.toString())
              
              ,
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
  String title; // Make title mutable by removing the `final` keyword
  final Function(String) onTapped;

  ExpandedSelectionWidget({
    super.key,
    required this.label,
    required this.textList,
    required this.onTapped,
    required this.title,
  });

  @override
  State<ExpandedSelectionWidget> createState() =>
      _ExpandedSelectionWidgetState();
}

class _ExpandedSelectionWidgetState extends State<ExpandedSelectionWidget> {
  late String currentTitle;

  bool expanded = false;
  ExpansionTileController expandedController = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    currentTitle =
        widget.title; // Initialize currentTitle with the widget's initial title
  }

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
              color: Color(0xff80BCBD).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
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
                currentTitle, // Use currentTitle for dynamic updates
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Color(0xff656567),
                      fontSize: 15,
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
                      setState(() {
                        currentTitle =
                            location; // Update the currentTitle on selection
                      });
                      widget.onTapped(location);
                      expandedController.collapse();
                    },
                    title: Text(
                      location,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorConstants.greenish,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
