import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/paragraph_widget.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class TPScreen extends StatelessWidget {
  const TPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: "Telepsychiatry",
      isBackAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ServiceTopWidget(
                image: AssetsConstants.tpImage,
                title: "What is Telepsychiatry?",
                heading:
                    "Improving Access to Mental Health Care Through Telepsychiatry",
                description:
                    "Telepsychiatry represents a forward-thinking approach in healthcare, leveraging telemedicine within the psychiatry realm. It encompasses the provision of psychiatric and mental health treatment facilities via telecommunications technology, predominantly through video conferencing. The American healthcare system faces a significant challenge in providing adequate psychiatric and mental health services. Telepsychiatry services play a crucial role in enhancing the accessibility of psychiatric services nationwide, offering patient-centric and cost-effective interventions",
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("What Is Tele psychiatry’s Role in Improving Access?",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.primaryTextColor,
                              )),
                  const SizedBox(height: 20),
                  Text(
                    "Economics:",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Telemedicine health introduces a cost-efficient model for mental health & primary care delivery, alleviating concerns about transportation, childcare, lost work hours, and other related expenses for patients. In many states, telemedicine coverage by insurance is on par with traditional in-person consultations.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorConstants.primaryTextColor,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Stigma:",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "While stigma can deter people from seeking mental health care, telemedicine health offers a discreet and accessible solution. It's particularly beneficial for patients who prefer the privacy of electronic communication over direct face-to-face interactions. As the healthcare sector strives to enhance service delivery and as mental health continues to impose significant economic strains on public systems, the prospects for telemedicine remain promising.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorConstants.primaryTextColor,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Geography:",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''Telepsychiatry/ Tele health ensures the availability of quality mental & Primary health care in any clinic with internet access. It addresses the acute service gaps in rural regions, facilitating quicker crisis intervention and smoother transitions into inpatient care without the burdens of travel.
''',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorConstants.primaryTextColor,
                        ),
                  ),
                ],
              ),
              const ServiceInfoCard(
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
