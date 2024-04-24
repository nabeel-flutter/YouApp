import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/paragraph_widget.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class ATScreen extends StatelessWidget {
  const ATScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: "Addiction Treatment",
      isBackAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceTopWidget(
                image: AssetsConstants.addictionTreatmentImage,
                title: "Empowering Lives, Renewing Hope",
                heading: "Holistic Recovery at NEW BEGINNINGS",
                description:
                    '''Embark on a trans formative journey towards lasting recovery and renewed hope at NEW BEGINNINGS, where we are committed to empowering lives through comprehensive and personalized addiction treatment. Our holistic approach is not just a pathway to sobriety but a road map to reclaiming a fulfilling and purpose-driven life.

At NEW BEGINNINGS, we understand that addiction is a complex interplay of physical, mental, and spiritual challenges. Therefore, our main focus is on providing holistic recovery solutions that address every facet of your well-being. Our dedicated team of professionals is here to guide you through a comprehensive range of evidence-based treatment services, ensuring that your unique needs are met with compassion and expertise.
''',
              ),
              ServiceInfoCard(
                title: "",
                description:
                    '''We recognize that you are more than your addiction when you come to New Beginnings for substance abuse treatment. We think that since you have special abilities, potential, and problems when you come to us, so should your care.

You owe it to yourself to work with our experienced team of doctors, clinicians, and counselors to create a one-of-a-kind, constantly evolving treatment plan, including addiction treatment, designed to help you get the most out of your recovery experience. If you're searching for a rehabilitation center near me, we can help you find the most suitable options. Our goal is to treat the whole person, and that means addressing co-occurring mental illness, physical wellness, social issues, and more.

When you graduate from our program, you’ll be ready to live a healthier, happier life without substance abuse.''',
              ),
              ParagraphWidget(
                heading: "Treatment Services",
                description:
                    '''Healing body, mind, and spirit means addressing addiction from every angle.
Every American Addiction Centers facility provides its own combination of proven therapies and services to meet your needs.
Group therapy is a big part of successful addiction treatment. Sharing your own experience and learning from others can make a big difference in your recovery journey. All American Addiction Centers facilities provide some combination of the following:''',
                secondHeading: "",
                bulletList: [],
              ),
              ParagraphWidget(
                bulletList: [],
                secondHeading: '',
                heading: "12-step groups",
                description: '''
• Process groups
• Trauma groups
• Grief groups
• First responder groups
• Veteran groups
• LGBTQ groups
• Anger management groups
• Mindfulness groups
• Communication groups
• Cognitive behavioral therapy groups
• Coping skills groups
• Psychodrama groups, and more.

Psychoeducation classes typically go over topics such as medication education, relapse prevention, and addiction treatment, including drug refusal skills. Alternative therapies available may, depending on the facility, include expressive therapies (such as art therapy or music therapy), equine therapy, recreational therapy, acupuncture, massage therapy, aromatherapy, and meditation.
''',
              ),
              ParagraphWidget(
                  bulletList: [],
                  secondHeading: '',
                  heading: "Psychiatric Services",
                  description:
                      '''One of the first things you’ll do as a part of your treatment at NEW BEGINNINGS is participate in a psychiatric evaluation. Mental illness and addiction often go hand in hand. We’ll talk to you about any mental illnesses you’re dealing with, and will either continue any current medications, make adjustments to what you’re taking, or prescribe something new, as part of addiction treatment and addiction treatment outpatient. If you're looking for rehab centers near me, we can help guide you to the most suitable options.
We use cutting-edge pharmacogenetic testing to predict how your body will respond to certain meds based on your DNA. The idea is to eliminate frustrating guesswork and get the right meds right away, so you can feel better, faster.
Our psychiatric team can also prescribe medications to help ease or eliminate withdrawal symptoms during Medical Detox. Many of our treatment centers also offer medication-assisted treatment (MAT) to reduce cravings and/or block the effects of drugs and alcohol. MAT, in combination with psychotherapy, is proven to be very effective in helping people get sober and stay that way long-term. Therapy Modalities
Psychotherapy is a broad term. What does it mean for you in addiction treatment and addiction treatment outpatient? Lasting recovery starts with the latest proven, research-based tactics* in addiction and mental health treatment, including:

• Cognitive behavioral therapy (CBT)
• Motivational interviewing (MI)
• Dialectical behavior therapy (DBT)
• Rational emotive behavior therapy (REBT)
• Eye movement desensitization and reprocessing (EMDR)
• Motivational enhancement therapy (MET)
• Seeking Safety
• Solution-focused therapy
• Facility offerings vary'''),
              ParagraphWidget(
                heading: "Holistic Care",
                bulletList: [],
                secondHeading: '',
                description:
                    '''Addiction touches all areas of your life, so does successful treatment.

At a NEW BEGINNINGS center, you or your loved one will have access to wellness education, services, and activities to enrich your recovery journey, including addiction treatment and addiction treatment outpatient. If you're seeking a drug rehabilitation center near me, we can assist you in finding suitable options. For example, you might choose to learn more about healthy eating or decide to quit smoking; maybe you’ll get moving with yoga, basketball, Zumba, or physical conditioning. If you have special dietary needs or simply want to eat healthier, most facilities offer consultations with registered dietitians. And if you’re dealing with medical issues or chronic disease, we can help you learn to manage your health, too.

Wellness means improving your quality of life from the inside out. Most NEW BEGINNINGS centers host faith-based services or religious/spirituality groups, and we’ll do everything we can to be sensitive to your religious needs. And if your addiction has left its mark on your career, many of our treatment centers offer services like resume building, job preparedness workshops, and help with job hunting as you get back on your feet.''',
              )
            ],
          ),
        ),
      ),
    );
  }
}
