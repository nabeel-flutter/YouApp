import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class IDScreen extends StatelessWidget {
  const IDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: "Individual Therapy",
      isBackAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceTopWidget(
                image: AssetsConstants.individualTherapyImage,
                title: "What is Individual Therapy?",
                heading: "Individual Therapy",
                description:
                    "Individual therapy, often referred to as psychotherapy or counseling, is a personalized process where clients engage in a one-on-one setting with a professional therapist. This secure, empathetic, and private setting allows individuals to delve into their emotions, beliefs, and behaviors, confront significant memories, recognize areas in their life they wish to alter, and gain a deeper understanding of themselves and others. The journey involves setting personal objectives and striving for the change they desire.",
              ),
              ServiceInfoCard(
                title: "\n\nHow do I get started?",
                description:
                    ''' Individuals seek therapy for various reasons, ranging from navigating substantial life changes or childhood traumas, managing depression or anxiety, to pursuing personal growth and enhanced self-awareness. The duration of the therapeutic partnership between a client and a therapist can span from a handful of sessions to several years, tailored to the client's distinct requirements and aspirations for therapy.
 
We aim to foster a cooperative relationship where we jointly determine the most suitable treatment approach for you. It's important to note that not all individuals will be recommended for ongoing therapy at our clinic. Our decisions are guided by what we deem most beneficial for the client.
 
Following the initial session, should we conclude that continuing therapy is in your best interest, you and your therapist will agree on a regular appointment schedule. Typically, this involves weekly sessions lasting about an hour each. During your second meeting, you will collaborate with your therapist to establish your therapy goals and commence the journey towards achieving them, whether it involves outpatient mental health treatment, addressing barriers to mental health treatment, or exploring holistic mental health treatment options.''',
              )
            ],
          ),
        ),
      ),
    );
  }
}
