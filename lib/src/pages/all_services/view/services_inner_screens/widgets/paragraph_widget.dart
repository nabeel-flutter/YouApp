import '../../../../../app/app_export.dart';
import 'unordered_list_widget.dart';

class ParagraphWidget extends StatelessWidget {
  final String heading;
  final String description;
  final String? secondHeading;
  final List<PsychiatristEvaluationTextList>? bulletList;
  const ParagraphWidget({
    super.key,
    this.heading = "What is involved in a psychiatric evaluation",
    this.description =
        "A comprehensive psychiatric evaluation is tailored to each individual, reflecting the diversity in symptoms and behaviors across patients. This evaluation is a critical component of mental health treatment, addressing a wide range of emotional, behavioral, or developmental disorders through various assessments",
    this.secondHeading,
    this.bulletList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          secondHeading!,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 20),
        UnorderedList(bulletList!)
      ],
    );
  }
}

