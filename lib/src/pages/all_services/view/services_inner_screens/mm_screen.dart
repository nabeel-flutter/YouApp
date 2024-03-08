import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/paragraph_widget.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class MMScreen extends StatelessWidget {
  const MMScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      isAppBar: true,
      appbarText: "Medication Management",
      isBackAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceTopWidget(
                image: AssetsConstants.medicationManagementImage,
                title: "Tracking Your Medications: Worksheet",
                heading:
                    "Simplifying Medication Management with a Comprehensive Tracker",
                description:
                    "With this user-friendly worksheet, managing your medications becomes hassle-free. Keep a detailed record of all your prescriptions, over-the-counter medications, and dietary supplements in one convenient place. Whether you're at home or visiting your healthcare provider, having this worksheet handy ensures accurate communication about your medication regimen. Stay organized and informed by updating your list regularly with any changes or additions. This tool empowers you to actively participate in your healthcare journey, promoting better medication adherence and overall well-being. Take control of your health today with this comprehensive medication management worksheet.",
              ),
              ParagraphWidget(
                heading: "What Should I Ask My Doctor During a Checkup?",
                bulletList: [],
                secondHeading: "",
                description:
                    '''What questions should I ask my doctor so I can best manage my health? Use these questions about tests, diagnoses, prescriptions, and side effects.

Upon completing a thorough assessment, a patient-centric diagnosis and treatment plan are established, often considering the potential role of medications. The process involves a detailed discussion on the concept of psychiatric medication  management and the initial assessment by psychiatric practitioners  can appear daunting, particularly for those new to psychiatric medications,  those with previous adverse experiences with medications, or individuals  uncertain about the suitability of medications for their symptoms. However,  comprehending the support provided by psychiatric professionals, the  significance of "medication management," and setting realistic  expectations for your psychiatric assessment can mitigate any concerns.
 
Mental health is deeply  intertwined with physical well-being. Life experiences, such as stress or  trauma, can lead to anxiety, feeling overwhelmed, and hopelessness,  potentially escalating into significant mental and physical health issues or  harmful behaviors if left unaddressed. Regular evaluations by a psychiatric practitioner,  similar to those conducted by a primary care provider, are crucial. These  assessments, focusing on your symptoms and the potential for medication to  aid in your mental health treatment, allow for a comprehensive approach to  your well-being. Unlike primary care that tends to focus more on physical  ailments, psychiatric care delves into the root of your mental health needs  through detailed discussions, aiming to provide a holistic approach to mental  health and wellness. 

Benefits and risks of various medication options, including their actions, uses, and potential side effects. Should the patient consent, a specific medication may be prescribed on a trial basis to gauge its efficacy, embodying the principle of medication management in psychiatric care. This approach is dynamic, with continuous evaluation of the medication's impact over time to ensure alignment with the patient's health objectives, recognizing the unique way psychiatric medications interact with each individual's brain chemistry.
 
The practice of medication management is nuanced, acknowledging the diverse responses individuals may have due to their distinct brain chemistries. Medications are typically considered alongside other therapeutic interventions like counseling, behavioral therapies, and life management skills to formulate a holistic treatment strategy aimed at enhancing mental health.
 
It's crucial to discuss the potential risks and side effects associated with prescription medications thoroughly, juxtaposing these against their benefits in a transparent conversation with each patient. While not all psychiatric conditions necessitate pharmacological intervention, in certain scenarios, prescription medications prove to be the most effective method to alleviate suffering, particularly in treating conditions like depression, anxiety, bipolar disorder, and schizophrenia, among others.''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
