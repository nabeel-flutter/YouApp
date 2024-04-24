import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/paragraph_widget.dart';
import 'package:your_app_test/src/pages/all_services/view/services_inner_screens/widgets/service_top_widget.dart';

@RoutePage()
class CPTScreen extends StatelessWidget {
  const CPTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: "Couple & Family Therapy",
      isBackAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ServiceTopWidget(
                image: AssetsConstants.familyTherapyImage,
                title: "Enhancing Relationships through Marriage Counseling",
                heading:
                    "Navigating Conflicts and Strengthening Bonds: The Role of Marriage Counseling",
                description:
                    "Individual therapy, often referred to as psychotherapy or counseling, is a personalized process where clients engage in a one-on-one setting with a professional therapist. This secure, empathetic, and private setting allows individuals to delve into their emotions, beliefs, and behaviors, confront significant memories, recognize areas in their life they wish to alter, and gain a deeper understanding of themselves and others. The journey involves setting personal objectives and striving for the change they desire.",
              ),
              const ParagraphWidget(
                heading: "Why it's done",
                description:
                    '''Marriage counseling is a vital resource for couples across all spectrums of intimate relationships, regardless of their sexual orientation or marital status. It serves as a foundational element of outpatient mental health treatment, offering a pathway to strengthen partnerships and enhance mutual understanding. Many couples turn to marriage counseling as a proactive measure to fortify their bond or to engage in premarital counseling. This early intervention can pave the way for a deeper connection and help resolve potential conflicts before they escalate, ensuring a solid foundation for marriage.
 
Conversely, marriage counseling is also sought after by couples facing challenges within their relationship. It provides strategies and solutions for a wide array of issues, such as:
 
Communication problems:
• Sexual difficulties
• Conflicts about child rearing or blended families
• Substance abuse
• Anger
• Infidelity
 
Marriage counseling might also be helpful in cases of domestic abuse. If violence has escalated to the point that you're afraid, however, counseling alone isn't adequate. Contact the police or a local shelter or crisis center for emergency support.''',
                bulletList: [],
                secondHeading: "",
              ),
              ParagraphWidget(
                heading: "How you prepare",
                description:
                    '''The initial step towards embarking on marriage counseling is to find a qualified therapist. This search can begin with a recommendation from your primary care doctor, or you might consider suggestions from family, friends, your health insurer, workplace employee assistance program, religious leaders, or local mental health agencies. It's beneficial to consult with multiple therapists to find the one that best suits your and your partner's needs.''',
                secondHeading: "",
                bulletList: [
                  PsychiatristEvaluationTextList(
                      text:
                          "When you're evaluating a potential therapist, it's important to assess their compatibility with both you and your partner. Key areas to inquire about include:",
                      innerList: [
                        "Education and experience. What is your educational and training background? Are you licensed by the state? Are you credentialed by the AAMFT? What is your experience with our type of issue?",
                        "Logistics. Where is your office? What are your office hours? Are you available in case of an emergency?",
                        "Treatment plan. How many sessions should we expect to have? How long is each session?",
                        "Fees and insurance. How much do you charge for each session? Are your services covered by our health insurance plan?"
                      ])
                ],
              ),
              const ParagraphWidget(
                bulletList: [],
                secondHeading: '',
                heading: "What you can expect",
                description: '''
Marriage counseling typically brings couples or partners together for joint therapy sessions. Working with a therapist, you'll learn skills to solidify your relationship, such as:
• Open communication
• Problem-solving
• How to discuss differences rationally
• You'll talk about the good and bad parts of your relationship as you pinpoint and better understand the sources of your conflicts. Together you'll learn how to identify problems without blame and instead examine how things can be improved. In some cases, couples may also consider couple and family counseling to address relationship issues within a broader family context.
''',
              ),
              const ParagraphWidget(
                heading: "What you can expect",
                description:
                    '''When thinking about marriage counseling, bear the following in mind:

It might be hard to talk about your problems with the counselor. Sessions might pass in silence as you and your partner remain angry over perceived wrongs — or you might yell or argue during sessions. Both are OK. Your therapist can act as a referee and help you cope with the resulting emotions.
You can go by yourself. If your partner refuses to attend marriage counseling sessions, you can still attend. It's more challenging to mend a relationship this way, but you can benefit by learning more about your reactions and behavior.
Therapy is often short term. Some people need only a few sessions of marriage counseling, while others need it for several months. The specific treatment plan will depend on your situation. Sometimes, marriage counseling helps couples discover that their differences truly are irreconcilable and that it's best to end the relationship. Sessions can then focus on skills for ending the relationship on good terms. If you're looking for family therapy near you, consider contacting a local therapist or counseling center to discuss your specific needs and find the right support for your situation.
You might have homework. Your counselor might suggest communication exercises at home to help you practice what you've learned during your session. For example, talking face-to-face to with your partner for a few minutes every day about nonstressful things — without any interruptions from TVs, phones or children.
You or your partner might need additional care. If one of you is coping with mental illness, substance abuse or other issues, your therapist might work with other health care providers to provide more complete treatment.
Making the decision to go to couple and family counseling caan be tough. If you have a troubled relationship, however, seeking help is more effective than ignoring your problems or hoping they get better on their own. Sometimes taking the first step by admitting the relationship needs help is the hardest part. Most individuals find the experience to be insightful and empowering. If you're searching for couple and family counseling near you, consider reaching out to a local therapist or counseling center to get the support you need.''',
                secondHeading: "",
                bulletList: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
