import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class PTScreen extends StatelessWidget {
  const PTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: "Play Therapy",
      isBackAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ServiceTopWidget(
                image: AssetsConstants.planTherapyImage,
                title:
                    "Nurturing Emotional Wellness through Playful Exploration",
                heading: "Tailoring Healing Through Play",
                description:
                    "Play therapy, while occasionally applied to adults, is predominantly a psychotherapeutic technique designed to assist children aged 3to 12 in navigating their experiences and expressing suppressed thoughts and emotions through play. This form of therapy typically unfolds in a secure, welcoming playroom environment where minimal restrictions are placed on the child. This approach fosters uninhibited expression and enables the therapist to gain insights into the child's preferences, decision-making processes, and manner of play. The overarching aim is to guide children towards articulating their feelings in more constructive manners, cultivating empathy and respect, and uncovering novel, affirmative strategies for problem-solving. Incorporating elements such as out patient mental health treatment can enhance the therapeutic experience by offering flexible support tailored to the child's evolving needs.",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorConstants.widgetBgColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  children: [
                    Text("Services",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: ColorConstants.primaryTextColor,
                                )),
                    const SizedBox(height: 20),
                    Text(
                      "Guiding You Towards Healing and Hope. Our Comprehensive Mental Health Services Offer Support and Empowerment Every Step of the Way. Together, Let's Rediscover Your Inner Strength and Resilience. You're Not Alone on This Journey.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const ServiceCardWidget(
                      heading: "When it is used",
                      description:
                          "Play therapy is instrumental for children facing social or emotional challenges, enhancing their communication, behavior modification, problem-solving abilities, and fostering positive interactions with others. It's particularly beneficial for those experiencing or exposed to significant stressors, including severe illness, hospitalization, domestic violence, abuse, trauma, familial upheavals, or notable environmental changes. This therapeutic approach supports children grappling with academic and social difficulties, learning disabilities, behavioral issues, anxiety, depression, grief, anger, as well as individuals diagnosed with attention deficit disorders or those on the autism spectrum. Integrating strategies like holistic mental health treatment within play therapy can offer a comprehensive approach, addressing the multifaceted needs of the child.",
                      image: AssetsConstants.ptImage1,
                    ),
                    const ServiceCardWidget(
                      heading: "What to expect",
                      description:
                          "In play therapy, the engagement of the parent or caregiver is crucial. The process commences with an initial intake interview with the parent to gather detailed information about the child, followed often by a separate dialogue with the child. This preliminary step enables the therapist to conduct a thorough assessment and craft an individualized treatment plan tailored to the child's needs. Within the confines of the playroom, children are prompted to engage with carefully selected toys that promote self-expression and the adoption of positive behaviors. The inclusion of arts and crafts, music, dance, storytelling, and other creative mediums enriches the therapeutic experience, facilitating emotional and behavioral growth. Play therapy sessions are typically conducted weekly, with a standard course consisting of around 20 sessions, each lasting between 30 to 45 minutes. Incorporating elements such as mental health treatment facilities can provide a structured and supportive environment, further enhancing the therapeutic journey",
                      image: AssetsConstants.ptImage2,
                    ),
                    const ServiceCardWidget(
                      heading: "How It Works",
                      description:
                          "Play therapy is tailored to meet the distinctive developmental requisites of young children, who typically find play a more natural medium for expression than verbal communication. Through play and other imaginative activities, therapists engage with the child, observing how the child utilizes these modalities to convey thoughts and emotions that remain unarticulated verbally. Play therapy encompasses two primary methodologies:",
                      image: AssetsConstants.ptImage3,
                    ),
                    const ServiceCardWidget(
                      heading: "What to Look for in a Play Therapist",
                      description:
                          "Play therapists are equipped with extensive training in child development, attachment theory, and the art of utilizing playas a means of connecting with children. Furthermore, a competent play therapist should possess expertise in a recognized therapeutic approach, such as child-centered, cognitive-behavioral, Adlerian, or Gestalt therapy. In your quest for a suitable therapist, it's imperative to consider not only their educational qualifications and professional experience but also your personal comfort level when addressing individual and familial concerns. Building a rapport and comfort with your therapist is paramount to the success of the therapeutic journey. Additionally, exploring therapists who incorporate diverse strategies like mental health and addiction treatment can offer a comprehensive and tailored approach to your child's well-being.",
                      image: AssetsConstants.ptImage4,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServiceCardWidget extends StatelessWidget {
  final String heading;
  final String description;
  final String? image;
  const ServiceCardWidget(
      {super.key,
      this.heading = "when it is used",
      this.description = "",
      this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        decoration: const BoxDecoration(color: ColorConstants.primaryColor),
        child: Column(
          children: [
            Image.asset(image!),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.white,
                        ),
                  ),
                  const Divider(
                    color: ColorConstants.yellowGolden,
                    thickness: 3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorConstants.white,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
