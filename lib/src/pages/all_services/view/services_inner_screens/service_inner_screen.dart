import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/models/services_model.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/paragraph_widget.dart';

import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';

@RoutePage()
class ServiceInnerScreen extends StatelessWidget {
  final ServiceModel service;
  const ServiceInnerScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceTopWidget(
                image: service.image!,
                title: "What is a comprehensive psychiatric evaluation?",
                heading:
                    "The Importance of Comprehensive Psychiatric Evaluation in Group Therapy",
                description:
                    'A comprehensive psychiatric evaluation is essential for diagnosing a spectrum of emotional, behavioral, or developmental disorders. This thorough assessment for children, adolescents, or adults is grounded in the observation of behaviors and their impact on various facets such as physical health, genetic predispositions, environmental influences, social interactions, cognitive functions, emotional stability, and educational performance.',
              ),
              const ServiceInfoCard(
                title: "Who is evaluated?",
                description:
                    "Often, it's the individuals closest to someone—a family member, spouse, teacher, or friend—who first notice signs of distress or behavioral changes. These signs may manifest as disruptions in relationships, work or school performance, sleep patterns, eating habits, substance use, emotional regulation, development, coping mechanisms, attentiveness, or responsiveness. It's crucial for those recognizing these signs to seek mental health treatment promptly to address and manage the underlying issues effectively.",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              ParagraphWidget(
                heading: "What is involved in a psychiatric evaluation",
                description:
                    "A comprehensive psychiatric evaluation is tailored to each individual, reflecting the diversity in symptoms and behaviors across patients. This evaluation is a critical component of mental health treatment, addressing a wide range of emotional, behavioral, or developmental disorders through various assessments",
                secondHeading: "Evaluation may include:",
                bulletList: ListConstants.psychiatristEvaluationTextList,
              ),
              const ServiceInfoCard(
                title: "",
                description:
                    "If you suspect a need for a psychiatric evaluation and mental health assessment, it's essential to consult a healthcare professional for guidance and support. A Mental health clinic can offer the necessary expertise and resources to address your concerns effectively.",
              ),
            ],
          ),
        ),
      ),
      isBackAppBar: true,
      appbarText: service.name,
    );
  }
}
