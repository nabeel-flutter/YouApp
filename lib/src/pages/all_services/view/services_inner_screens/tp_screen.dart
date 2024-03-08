import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class TPScreen extends StatelessWidget {
  const TPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: "Telepsychiatry",
      isBackAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceTopWidget(
                image: AssetsConstants.tpImage,
                title: "What is Telepsychiatry?",
                heading:
                    "Improving Access to Mental Health Care Through Telepsychiatry",
                description:
                    "Telepsychiatry represents a forward-thinking approach in healthcare, leveraging telemedicine within the psychiatry realm. It encompasses the provision of psychiatric and mental health treatment facilities via telecommunications technology, predominantly through video conferencing. The American healthcare system faces a significant challenge in providing adequate psychiatric and mental health services. Telepsychiatry services play a crucial role in enhancing the accessibility of psychiatric services nationwide, offering patient-centric and cost-effective interventions",
              ),
              ServiceInfoCard(
                title:
                    "\nWhat does telepsychiatry look? Like for a typical patient?",
                description:
                    '''The telepsychiatry experience diverges from traditional in-person psychiatric services. Patients engage with psychiatrists via videoconferencing, mimicking an in-person visit while possibly at a mental health facility but within a private setting for one-on-one sessions.
 
The scope of these appointments mirrors that of in-person visits, where doctors delve into issues, formulate treatment plans, and may prescribe medications through telepsychiatry. Subsequent appointments and referrals can also be managed similarly, offering patients substantial savings in travel time and expenses.''',
              )
            ],
          ),
        ),
      ),
    );
  }
}
