import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class PCScreen extends StatelessWidget {
  const PCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      isBackAppBar: true,
      appbarText: "Primary Care",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceTopWidget(
                image: AssetsConstants.primaryCareImage,
                title: "Your Trusted First Point of Contact",
                heading: "Compassionate Primary Care for Every Stage of Life",
                description:
                    "In times of health concerns, our primary care and family health centers serve as the initial touchpoint for many patients and families. We recognize the pivotal role we play in your well-being journey. Our dedicated team of healthcare professionals combines expertise with empathy, ensuring that you receive comprehensive care and support. From routine check-ups to addressing mental health challenges, we are committed to providing accessible and compassionate services that prioritize your overall health and wellness.",
              ),
              ServiceInfoCard(
                title: "Comprehensive Mental Health Services Tailored to You",
                description:
                    '''Our commitment to providing the highest quality patient care with compassion and professionalism is unwavering. We prioritize preventive medicine and early detection of health issues, creating a comfortable, supportive environment for all. From routine physicals to specialized geriatric care, we are equipped to address a range of health needs. Whether it's urgent medical matters, wellness resources, or referrals to other specialists, our dedicated team is ready to assist you at every stage of life.

In times of health concerns, our primary care and family health centers serve as the initial touchpoint for many patients and families. We recognize the pivotal role we play in your well-being journey. Our integrated approach ensures seamless coordination between our mental health specialists and primary care physicians, allowing for comprehensive assessments and personalized treatment plans that address both your physical and emotional needs.

At New Beginnings we understand that mental health is a vital component of overall wellness. That's why our team is committed to providing accessible and inclusive care to individuals of all backgrounds and walks of life. Whether you're seeking support for anxiety, depression, trauma, or any other mental health challenge, our compassionate professionals are here to offer evidence-based interventions and unwavering support to help you thrive. With a focus on empowerment and resilience, we empower our clients to overcome obstacles, build coping skills, and live fulfilling lives rooted in mental wellness.''',
              )
            ],
          ),
        ),
      ),
    );
  }
}
