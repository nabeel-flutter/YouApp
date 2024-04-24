import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/mental_health/mental_health_inner_pages/development_disability/components/radio_list_development_disability.dart';
import 'package:your_app_test/src/pages/mental_health/mental_health_inner_pages/development_disability/data_list/development_disablity_main_questions_data_list.dart';
import 'package:your_app_test/src/pages/mental_health/mental_health_inner_pages/development_disability/data_list/observation_questions_filled_by_doctor.dart';

class DevlopmentDiabilityScreen extends StatelessWidget {
  const DevlopmentDiabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            QuestionsRadioListRowComponent(
                questions: developmentDisabilityMainQuesions),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.obervationQuestions,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontFamily: FontConstants.gilroySemiBold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      StringConstants.toBeCompletedByProvider,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontFamily: FontConstants.gilroySemiBold),
                    ),
                  ),
                ],
              ),
            ),
            QuestionsRadioListRowComponent(
                questions: developmentDisabilityObservationQuesions),
            const BottomResultIdentifierWidget(),
          ],
        ),
      ),
      isGradient: false,
      appBar: AppBarcomponent(
          isGradient: false,
          title: StringConstants.developmentDisabilityIDD,
          isBackAppBar: true,
          isTitleTowLines: false),
    );
  }
}

class QuestionsRadioListRowComponent extends StatelessWidget {
  const QuestionsRadioListRowComponent({
    super.key,
    required this.questions,
  });
  final List<Question> questions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: questions
          .asMap()
          .entries
          .map((question) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionFormHeading(questions: question),
                  RadioListDevelopmentDisability(questions: question)
                ],
              ))
          .toList(),
    );
  }
}
