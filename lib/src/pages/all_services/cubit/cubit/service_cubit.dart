import 'package:new_beginnings/src/app/app_export.dart';

part 'service_state.dart';
part 'service_cubit.freezed.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(const ServiceState.initial());

  final TextEditingController searchController = TextEditingController();
  List<ServiceModel> services = [
    ServiceModel(
        name: "Psychiatric\nEvaluation",
        image: AssetsConstants.pscyEvImage,
        description:
            "Psychiatric evaluation is a comprehensive assessment of a patient's mental and physical health"),
    ServiceModel(
        name: "Group Therapy",
        image: AssetsConstants.groupTherapyImage,
        description:
            "Group therapy is a form of mental health treatment that congregates individuals facing akin hurdles in a nurturing and structured environment. Facilitated by a professional therapist, this approach allows participants to share their journeys, emotions, and insights, cultivating a community of empathy and understanding. It's an exceptional avenue for members to discover coping mechanisms, engage in reciprocal feedback, and foster a network of support.  The intimate nature of group therapy, typically comprising a small number of individuals, ensures impactful interactions and the growth ofa supportive circle. This collective experience not only alleviates the sense of isolation but also propels personal development. By actively engaging and supporting one another, members collectively navigate towards enhanced menta land emotional health. For those seeking group therapy near me or adult therapy, this modality serves as a pivotal resource to connect with local groups and embark on a Tran’s formative healing journey"),
    ServiceModel(
        name: "Medication\nManagement",
        image: AssetsConstants.medicationManagementImage,
        description:
            "With this user-friendly worksheet, managing your medications becomes hassle-free. Keep a detailed record of all your prescriptions, over-the-counter medications, and dietary supplements in one convenient place. Whether you're at home or visiting your healthcare provider, having this worksheet handy ensures accurate communication about your medication regimen. Stay organized and informed by updating your list regularly with any changes or additions. This tool empowers you to actively participate in your healthcare journey, promoting better medication adherence and overall well-being. Take control of your health today with this comprehensive medication management worksheet."),
    ServiceModel(
        name: "Play Therapy",
        image: AssetsConstants.planTherapyImage,
        description:
            "Play therapy, while occasionally applied to adults, is predominantly a psychotherapeutic technique designed to assist children aged 3to 12 in navigating their experiences and expressing suppressed thoughts and emotions through play. This form of therapy typically unfolds in a secure, welcoming playroom environment where minimal restrictions are placed on the child. This approach fosters uninhibited expression and enables the therapist to gain insights into the child's preferences, decision-making processes, and manner of play. The overarching aim is to guide children towards articulating their feelings in more constructive manners, cultivating empathy and respect, and uncovering novel, affirmative strategies for problem-solving. Incorporating elements such as out patient mental health treatment can enhance the therapeutic experience by offering flexible support tailored to the child's evolving needs."),
    ServiceModel(
        name: "Individual Therapy",
        image: AssetsConstants.individualTherapyImage,
        description:
            "Individual therapy, often referred to as psychotherapy or counseling, is a personalized process where clients engage in a one-on-one setting with a professional therapist. This secure, empathetic, and private setting allows individuals to delve into their emotions, beliefs, and behaviors, confront significant memories, recognize areas in their life they wish to alter, and gain a deeper understanding of themselves and others. The journey involves setting personal objectives and striving for the change they desire."),
    ServiceModel(
        name: "Couple & Family Therapy",
        image: AssetsConstants.familyTherapyImage,
        description:
            "Marriage counseling, also known as couples therapy, isa specialized form of psychotherapy aimed at helping couples confront and navigate through conflicts within their relationship, enhancing their bond. Whether the goal is to make informed decisions about the future of the relationship or to fortify the connection, marriage counseling offers a platform for both. Administered by licensed marriage and family therapists, often with credentials from the American Association for Marriage and Family Therapy (AAMFT),this therapy caters to couples from all walks of life, irrespective of their marital status or sexual orientation. While marriage counseling is usually a short-term engagement, the duration and involvement of partners can vary, tailored to each couple's unique circumstances."),
    ServiceModel(
        name: "Pharmacogenomics",
        image: AssetsConstants.pmImage,
        description:
            "Pharmacogenomics, despite its complex terminology, is proving to be a transformative discipline with substantial benefits for numerous individuals. By exploring the genetic variations influencing individual responses to medications, pharmacogenomics has emerged as a promising field facilitating personalized medicine. This innovative approach has the potential to revolutionize drug therapy by tailoring treatments to an individual's genetic makeup, thereby enhancing efficacy and reducing adverse reactions. As pharmacogenomics continues to evolve, its impact on healthcare delivery and patient outcomes is increasingly recognized, underscoring the significance of understanding its foundational principles."),
    ServiceModel(
        name: "Addiction Treatment",
        image: AssetsConstants.addictionTreatmentImage,
        description:
            "Embark  on a transformative journey towards recovery with our comprehensive addiction treatment services. Our multidisciplinary team of professionals is dedicated to providing personalized care and support to individuals struggling with substance abuse and addiction. Our evidence-based approach encompasses a range of therapeutic modalities, including individual and group therapy, medication management, and psychiatric evaluation. We are committed to empowering our clients to overcome addiction, regain control of their lives, and achieve lasting sobriety. Our compassionate and confidential services are designed to address the unique needs of each individual, fostering a supportive environment for healing and growth. Take the first step towards a brighter future by reaching out to our addiction treatment team today."),
    ServiceModel(
        name: "Telepsychiatry",
        image: AssetsConstants.tpImage,
        description:
            "Telepsychiatry represents a forward-thinking approach in healthcare, leveraging telemedicine within the psychiatry realm. It encompasses the provision of psychiatric and mental health treatment facilities via telecommunications technology, predominantly through video conferencing. The American healthcare system faces a significant challenge in providing adequate psychiatric and mental health services. Telepsychiatry services play a crucial role in enhancing the accessibility of psychiatric services nationwide, offering patient-centric and cost-effective interventions"),
    ServiceModel(
        name: "Primary Care",
        image: AssetsConstants.primaryCareImage,
        description:
            "In times of health concerns, our primary care and family health centers serve as the initial touchpoint for many patients and families. We recognize the pivotal role we play in your well-being journey. Our dedicated team of healthcare professionals combines expertise with empathy, ensuring that you receive comprehensive care and support. From routine check-ups to addressing mental health challenges, we are committed to providing accessible and compassionate services that prioritize your overall health and wellness."),
  ];

  void getServices() {
    emit(ServiceState.loaded(services));
  }

  void searchService(String value) {
    if (value.isEmpty) {
      emit(ServiceState.loaded(services));
    } else {
      List<ServiceModel> searchResult = services
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(ServiceState.loaded(searchResult));
    }
  }
}
