import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/paragraph_widget.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_info_card.dart';
import 'package:new_beginnings/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class PMScreen extends StatelessWidget {
  const PMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBackground(
      appbarText: "Pharmacogenomics",
      isBackAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceTopWidget(
                image: AssetsConstants.pmImage,
                title: "Pharmacogenomics: Understanding the Basics",
                heading: "Unveiling the Fundamentals of Pharmacogenomics",
                description:
                    "Pharmacogenomics, despite its complex terminology, is proving to be a transformative discipline with substantial benefits for numerous individuals. By exploring the genetic variations influencing individual responses to medications, pharmacogenomics has emerged as a promising field facilitating personalized medicine. This innovative approach has the potential to revolutionize drug therapy by tailoring treatments to an individual's genetic makeup, thereby enhancing efficacy and reducing adverse reactions. As pharmacogenomics continues to evolve, its impact on healthcare delivery and patient outcomes is increasingly recognized, underscoring the significance of understanding its foundational principles.",
              ),
              ServiceInfoCard(
                title:
                    "\nHow do my genes affect how medications may work for me?",
                description:
                    '''Some medications may work better with your unique genetic profile and some medicines might not work at all for you. Your genes can affect how quickly your body breaks down (metabolizes) medicine and gets medicine into your bloodstream.
 
When a medication doesn’t work well with your genes, you may not get the relief you need and you may have unwanted side effects. By gathering information about your genetic profile, you and your healthcare provider can make better informed decisions regarding your treatment. Medicines that align well with your genes may work better and with fewer side effects.''',
              ),
              SizedBox(height: 20),
              ParagraphWidget(
                heading: "What is pharmacogenomics?",
                bulletList: [],
                secondHeading: "",
                description:
                    '''Pharmacogenomics uses information about a person’s genetic makeup, or genome, to choose the medication and dosage that are likely to work best for that person.2
The field of pharmacogenomic testing, including Genesight testing, has revolutionized how medications are prescribed and taken. Until recently, drugs have been developed in a “one size fits all” kind of approach. Pharmacogenomic tests, often discussed in Genesight reviews for their effectiveness, evaluate a person’s DNA to determine how they may metabolize or respond to medications. This type of testing helps guide healthcare providers in choosing medications and dosing. While it cannot confirm which medications or doses will work for a patient, it can point out which medications to avoid.''',
              ),
              ParagraphWidget(
                heading: "Types of pharmacogenomics?",
                description:
                    '''There are two types of genes studied in pharmacogenomics:

• Pharmacodynamic: these genes make proteins that affect how a medication works and what it does to the body

• Pharmacokinetic: these genes make proteins that affect the movement of the medication through the body (i.e., enzymes in the liver that break down the medications)


Pharmacogenomic testing, which examines an individual's genetic makeup, plays a crucial role in understanding how these genes can impact medication response and effectiveness.
''',
                secondHeading: "",
                bulletList: [],
              ),
              SlidingCardWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class SlidingCardWidget extends StatelessWidget {
  const SlidingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView();
  }
}
