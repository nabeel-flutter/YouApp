import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class GTScreen extends StatelessWidget {
  const GTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceTopWidget(
                title:
                    "Nurturing Mental Health and Emotional Growth Through Group Therapy",
                image: AssetsConstants.groupTherapyImage,
                heading: "Finding Support Through Group Therapy",
                description:
                    "Group therapy is a form of mental health treatment that congregates individuals facing akin hurdles in a nurturing and structured environment. Facilitated by a professional therapist, this approach allows participants to share their journeys, emotions, and insights, cultivating a community of empathy and understanding. It's an exceptional avenue for members to discover coping mechanisms, engage in reciprocal feedback, and foster a network of support. The intimate nature of group therapy, typically comprising a small number of individuals, ensures impactful interactions and the growth ofa supportive circle. This collective experience not only alleviates the sense of isolation but also propels personal development. By actively engaging and supporting one another, members collectively navigate towards enhanced menta land emotional health. For those seeking group therapy near me or adult therapy, this modality serves as a pivotal resource to connect with local groups and embark on a Tran’s formative healing journey",
              )
            ],
          ),
        ),
      ),
      appbarText: "Group Therapy",
      isBackAppBar: true,
    );
  }
}
