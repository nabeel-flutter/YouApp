import 'package:new_beginnings/src/app/app_export.dart';

class PrivacyPolicyBody extends StatelessWidget {
  const PrivacyPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        ParaWidget(
          heading: "Information We Collect",
          description:
              "When you visit our app or use our services, we may collect certain information about you, including but not limited to your name, email address, phone number, and browsing activity. We also collect IP addresses for analytics purposes within our product. We collect this information to provide and improve our services, communicate with you, and personalize your experience.",
        ),
        ParaWidget(
          heading: "How We Use Your Information",
          description:
              "We use the information we collect to operate, maintain, and improve our app and services, as well as to communicate with you about your account and any updates or promotions. We may also use your information to analyze trends, monitor usage, customize content and advertisements, and utilize IP addresses for analytics purposes within our product.",
        ),
        ParaWidget(
          heading: "Sharing of Your Information",
          description:
              "We may share your personal information with third-party service providers who assist us in operating our app and providing our services. These providers are obligated to protect your information and only use it for the purposes we specify. We may also disclose your information when required by law or to protect our rights, property, or safety.",
        ),
        ParaWidget(
          heading: "Data Security",
          description:
              "We take the security of your information seriously and implement appropriate measures to protect it from unauthorized access, alteration, disclosure, or destruction. However, please note that no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.",
        ),
        ParaWidget(
          heading: "Your Choices And Rights",
          description:
              "You have the right to access, update, or delete your personal information at any time. You may also opt out of receiving promotional emails or communications from us. However, please note that certain information is necessary for us to provide our services, and opting out may affect your ability to use our app or access certain features.",
        ),
      ],
    );
  }
}
