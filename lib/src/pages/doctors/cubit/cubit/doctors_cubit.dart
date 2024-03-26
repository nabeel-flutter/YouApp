import 'package:new_beginnings/src/app/app_export.dart';

part 'doctors_state.dart';
part 'doctors_cubit.freezed.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(const DoctorsState.initial());

  final List<Doctor> doctors = [
    Doctor(
        name: "Nadeem Bashir",
        specialty: "Chef Executive Officer",
        image: AssetsConstants.nadeemPic,
        description:
            "Nadeem Bashir is the Chief Executive Officer of New Beginnings Integrated Healthcare. He oversees NB Centers'  strategies and operations across a network of 10 sites in 6 states. Mr. Bashir is deeply committed to advancing  healthcare, especially in mental health. His leadership skills and experience in healthcare settings underscore his impact  and strategic approach. He has initiated several mental health care delivery enhancement initiatives, leveraging  technology to improve patient outcomes and increase access to care. Prior to his role at New Beginnings Integrated Healthcare, Mr. Bashir worked as an Information Technology executive for  22 years, supporting high-performance contracts with some of the world's leading aerospace and defense technology  companies. Nadeem's dedication to improving the healthcare industry goes beyond his professional endeavors. He is a vocal  advocate for mental health awareness and actively supports initiatives aimed at enhancing mental health care access  and quality. Nadeem holds a bachelor's degree in Electrical Engineering from The City University of New York and a master's degree  in Human Relations from the University of Oklahoma. These degrees further enhance his ability to understand and  navigate complex business environments.",
        rating: "4.2",
        reviews: "290",
        noOfPatients: "678",
        yearsOfExperience: "8",
        department: "Executive Management"),
    //TODO: add COO details when available
    // Doctor(
    //     name: "Imran Farooqi",
    //     specialty: "Chief Operating Officer",
    //     image: AssetsConstants.nadeemPic,
    //     description:
    //         "Imran Farooqi is the Chief Operating Officer of New Beginnings Integrated Healthcare. He oversees NB Centers'  strategies and operations across a network of 10 sites in 6 states. Mr. Farooqi is deeply committed to advancing  healthcare, especially in mental health. His leadership skills and experience in healthcare settings underscore his impact  and strategic approach. He has initiated several mental health care delivery enhancement initiatives, leveraging  technology to improve patient outcomes and increase access to care. Prior to his role at New Beginnings Integrated Healthcare, Mr. Farooqi worked as an Information Technology executive for  22 years, supporting high-performance contracts with some of the world's leading aerospace and defense technology  companies. Imran's dedication to improving the healthcare industry goes beyond his professional endeavors. He is a vocal  advocate for mental health awareness and actively supports initiatives aimed at enhancing mental health care access  and quality. Imran holds a bachelor's degree in Electrical Engineering from The City University of New York and a master's degree  in Human Relations from the University of Oklahoma. These degrees further enhance his ability to understand and  navigate complex business environments.",
    //     rating: "4.2",
    //     reviews: "290",
    //     noOfPatients: "678",
    //     yearsOfExperience: "8",
    //     department: "Executive Management"),
    Doctor(
        name: "Dr. Raheel Siddiqui",
        specialty: "DSc President",
        image: AssetsConstants.docRaheelPic,
        description:
            "Dr. Siddiqui did his undergraduate studies in Karachi Pakistan and moved to the United States in 1999 where he completed his Master’s in Business Administration and his Doctorate program in Ergonomics Rehabilitation. Dr. Siddiqui has a passion for the health care field and has owned many healthcare related businesses throughout his career including Behavioral Health, Physical Therapy, Primary Care, and pharmacological research-based business. He invests most of his time traveling to his numerous company locations and oversees the fiscal and operational infrastructure, expansion efforts.",
        rating: "4.5",
        reviews: "200",
        noOfPatients: "2000",
        yearsOfExperience: "10",
        department: "Executive Management"),
    Doctor(
        name: "Alissa Emerich",
        specialty: "MS - Director of Clinical Training",
        image: AssetsConstants.docAlissaPic,
        description:
            "Alissa Emerich initially joined New Beginnings in 2018 as a therapist. While pursuing her master’s degree she began to find her niche within management, training, succession planning, and resource allocation. She holds her MS degree in Clinical Psychology from Purdue University, a BS degree in Psychology from Wilkes University, and her AA degree from Reading Area Community College. She looks forward to pursing her PhD in Business Management and continuing to strengthen the community through mental health education awareness, programming, and outreach. Her love of working with her peers at New Beginnings and passion for the holistic approach that the company offers clients is what makes the job so rewarding. Alissa resides in Pennsylvania with her husband and their daughter. They enjoy their time together with their dogs, friends, and family in any outdoor setting.",
        rating: "4.0",
        reviews: "300",
        noOfPatients: "658",
        yearsOfExperience: "11",
        department: "Management"),
    Doctor(
        name: "Rizwan Malik",
        specialty: "MD- Medical Director & Project Advisor",
        image: AssetsConstants.rizwanMalikPic,
        description:
            '''Dr. Rizwan Malik is a board-certified adult, child & adolescent psychiatrist who has been trained to see children, adolescents and adults struggling with various mental or psychiatric and behavioral problems. After completing his medical school Dr. Malik pursued his further training in psychiatry in Washington DC. After completing his residency training at St. Elizabeths Hospital in in Washington DC, he did fellowship and specialization in child and adolescent psychiatry at Albert Einstein College of medicine New York affiliated program.
Over the last 20 years, Dr. Malik has served in various positions and has been the medical director of the hospital and has done administrative psychiatry and at the same time has worked in public and private sector in various outpatient clinics and hospitals treating children and adults with various psychiatric disorders such as ADHD, autism, anxiety disorders, bipolar disorders depressive disorders, substance use disorders, sexual disorders and disorders related to child abuse neglect and learning disorders, just to name a few. Dr. Malik is also an expert in treating autism in children now called as ASD (autism spectrum disorder).''',
        rating: "4.2",
        reviews: "280",
        noOfPatients: "658",
        yearsOfExperience: "11",
        department: "Management"),
    Doctor(
        name: "Lori Bickwoski",
        specialty: "Provider & Medical Care Manager",
        image: AssetsConstants.loriPic,
        description:
            "Lori Bickowski is a graduate of McCann School of Business. Lori has worked in the health care industry as a medical assistant for over 20 years. Lori resides in Mahanoy City with her husband, 3 children and their dog, Tyson. In her personal life, Lori enjoys reading, attending her children’s sporting events and spending time with her family and friends.",
        rating: "4.0",
        reviews: "300",
        noOfPatients: "658",
        yearsOfExperience: "11",
        department: "Management"),
    Doctor(
        name: "Dr. William Belfar",
        specialty: "Clinical Mental Health Counseling",
        image: AssetsConstants.williamPic,
        description:
            "Dr. William S. Belfar, born in Brooklyn, New York, in 1963, commenced his academic journey with a degree in electrical engineering from SUNY at Stony Brook in May 1986. Transitioning to medicine, he earned his MD from New York University School of Medicine in May 1990. Dr. Belfar pursued specialized training, completing Neurology Residency at Boston University Medical Center in June 1994, followed by Psychiatry Residency at Johns Hopkins University Medical Center in June 1997. Further honing his expertise, he completed a fellowship in Forensic Psychiatry at the Albert Einstein College of Medicine in June 1998. Dr. Belfar is a board-certified psychiatrist recognized for his excellence in providing high-quality care, particularly in forensic psychiatry, garnering respect and recognition in his field.",
        rating: "4.0",
        reviews: "300",
        noOfPatients: "658",
        yearsOfExperience: "11",
        department: "Management"),

    Doctor(
        name: "Sean Lyons",
        specialty: "BA, LSW, MSW",
        image: AssetsConstants.seanPic,
        description:
            "Sean Lyons works with children and adults who are experiencing emotional and behavioral issues. He provides individual, co-caregiver, and family group therapy in order to enhance caregivers’ ability to cope and intervene effectively with a child who experiences Serious Emotional Disturbance. Sean earned a Master's of Social Work from Temple University and a Bachelor of Arts in Criminal Justice Administration from Mansfield State University of Pennsylvania. He is a Licensed Social Worker and is certified in Safe Crisis Management Functional Behavior Analyst. Sean utilizes different therapeutic approaches in therapy sessions, depending on the individual's issue(s). His practice is to collaborate with clients to develop treatment plans that reflect agreed upon goals. He develops and implements individualized behavioral treatment plans for children with Autism, Attention Deficit Hyperactivity Disorder, Oppositional Defiant Disorder, and Mood Disorder.Sean works one-on-one with children to improve socially significant behavior such as appropriate coping techniques, social interaction, safety awareness, attention to task, and conflict resolution. Sean’s goal is to improve overall family member psychosocial functioning in order to prevent out of home placement. He is an advocate for children and families in order to promote effective and long-lasting shifts in the family ecosystem.",
        rating: "4.3",
        reviews: "300",
        noOfPatients: "658",
        yearsOfExperience: "11",
        department: "Provider"),
    Doctor(
        name: "Dr. Charles Jin",
        specialty: "MD- Medical Director",
        image: AssetsConstants.charlesPic,
        description:
            "The psychiatry residency program at Albert Einstein College of Medicine in New York was successfully completed, followed by fellowship training in Child & Adolescent Psychiatry and Addiction Psychiatry. Board certification from the American Board of Psychiatry and Neurology was obtained, specializing in pediatric psychiatry, addiction psychiatry, and psychosomatic medicine (C-L psychiatry). For the past 5 years, the role of Chief Psychiatrist was held at a teaching hospital in Delaware, recognized as an academic center for the state. This hospital offers an ACGME approved psychiatric residency program and maintains academic affiliations with U Penn forensic psychiatry fellowship program and Drexel University School of Medicine. Previous roles included serving as Chief Psychiatrist for the Department of Juvenile Justice and family courts of New York City. Additionally, served as Medical Director of C-L service at the Division of Child Psychiatry and the Clinical and Fellowship Training Director at North Shore University Hospital (NYU School of Medicine program). This individual has fulfilled core teaching faculty and clinical supervisor roles for addiction and child and adolescent psychiatry fellowship programs for many years. They have presented lecture series covering various psychiatry topics, including psychopharmacology, neurobiology of addiction, neurobiology of developmental psychiatry, and behavioral genetics, which were well received by residents and fellows in training. Extensive experience in treating patients of all age groups, particularly those with serious, challenging mental illnesses in both urban and suburban populations with comorbidities of substance use disorders, learning and developmental disabilities, and medical illnesses such as HIV, renal failures, and pediatric oncology patients, etc. Numerous papers have been published in peer-reviewed journals, including the American Journal of Psychiatry, along with contributing a book chapter to a major psychiatric textbook (Textbook of Psychiatry, 2nd edition, and 3rd edition, edited by Allan Tasman, Jerald Kay, and Jeffery Lieberman).",
        rating: "4.1",
        reviews: "280",
        noOfPatients: "1000",
        yearsOfExperience: "11",
        department: "Providers"),
    Doctor(
        name: "James Walsh",
        specialty: "Phd- Clinical Director",
        image: AssetsConstants.jamesPic,
        description:
            "James W. Walsh is the Clinical Director at New Beginnings Professional Counseling and Consulting  Services. He has 30 years’ experience in Human Services with extensive experience in many aspects of  the field. He has held positions in the provision of services for the Intellectually Disabled as a Program  Specialist. In the Mental Health area as a Lead Therapist, Director of a Family-Based Program, Clinical  Coordinator, Mobile Therapist, Behavioral Consultant for curriculum development and was  commended for his work in winning Regional Accreditation for one of the first non-traditional schools.  He chaired an Autism Council and served on the State Roundtable for Facilitated Communication. He  authored 2 books and 2 dissertations and holds a Ph.D.,in Psychology and Christian Counseling and  another in Executive Leadership. He was elected Mayor of the town he grew up in (Palo Alto Pa.) and  served in the U.S. Coast Guard for 1 year overseas and 3 years Stateside. He enjoys physical fitness and  reading and he and his wife CeCe enjoy the Cape May, New Jersey beach. They have three children,  three grandchildren, two grand-dogs and a grand-cat.",
        rating: "4.4",
        reviews: "300",
        noOfPatients: "650",
        yearsOfExperience: "11",
        department: "Providers"),
    Doctor(
        name: "Nancy Allen",
        specialty: "MS,CRNP",
        image: AssetsConstants.nancyPic,
        description:
            "Nancy Allen is a native of Schuylkill County. She earned a Bachelor of Science from the University of Louisville and worked as a bedside nurse in the ICU for more than 10 years. She then completed a Master of Science in Nursing from Graceland University as a Family Nurse Practitioner. Practicing for more than 10 years in Primary Care. She provides high quality care for acute and chronic illnesses. Her patient care includes comprehensive mental health assessments and develops treatments of mental health issues. She has special interest in the geriatric population and has managed the care of residents in long-term care facilities, both acute and chronic. While working in Family Care she realized there is a severe need for mental health care, and most recently, she is engaged in a Post Master's Degree in Mental Health to provide improved care to patients with mental illness .",
        rating: "4.0",
        reviews: "270",
        noOfPatients: "658",
        yearsOfExperience: "3",
        department: "Providers"),
    Doctor(
        name: "Kimberly Fleming",
        specialty: "Mental Health Therapist",
        image: AssetsConstants.kimberlyPic,
        description:
            "When human beings experience trauma or severe life stressors, it is not uncommon for their lives to unravel.  Kimberley’s great passion is bringing healing to people who have been through a traumatic or stressful experience.  Within the practice of New Beginnings, she helps her clients who include children and adults to find healthy perceptions  of themselves and strengthen their relationships. Most of all she helps them heal. She takes clients from ages 4 and up  and specializes in children. Kimberley began her career working as a school-based therapist in 2005 helping children and  family struggling with child abuse and neglect. She addressed challenges such as ADHD, autism, anxiety, and depression.  Since then, Kimberley has worked in several capacities and roles such as counseling, psychiatric consult in a mental  health facility, crisis intervention team and behavioral specialist. She has been trained in a range of modalities such as  play therapy, relational therapy, somatic and trauma training, and cognitive behavioral therapy. Her approach is client  and family centered focused on evidence-based therapies such as cognitive behavioral therapy. Kimberley has  therapeutic interests in the areas of mindfulness, parenting and family issues, child and adolescent development and  clinical areas of anxiety, depression, substance abuse and trauma.",
        rating: "4.5",
        reviews: "290",
        noOfPatients: "1200",
        yearsOfExperience: "11",
        department: "Providers"),
    Doctor(
        name: "Jamie Evans",
        specialty: "LCSW",
        image: AssetsConstants.jamiePic,
        description:
            "Following the completion of my undergraduate degree at Millersville University, my career was initiated in a residential treatment setting where care was provided to adolescents with behavioral health issues. Subsequently, upon the conclusion of my graduate studies and the attainment of a master's degree in social work from Widener University, a transition was made to outpatient treatment, where diagnostic and psychotherapy services were extended to adults and adolescents. Throughout my twenty-year career, a multi-modal approach to care has been developed, incorporating motivational interviewing, cognitive behavioral therapy, and solution-focused treatment to assist clientele in achieving their objectives. Working closely with individuals enduring chronic diseases and high-stress lifestyles, a profound understanding has been gained regarding the integral link between an individual's physical and mental well-being. Embracing a holistic treatment style, care is extended to nurture the mind, body, and soul.",
        rating: "4.2",
        reviews: "290",
        noOfPatients: "678",
        yearsOfExperience: "8",
        department: "Providers"),
    Doctor(
        name: "Amanda Hoover",
        specialty: "Clinical Mental Health Counseling",
        image: AssetsConstants.amandaPic,
        description:
            '''Over the past 18 years within the mental health field, Amanda has carried extensive caseloads in working to develop her own personal niche while continuing to incorporate therapeutic approaches within her sessions. Amanda uses holistic and integrative approaches where clients can explore their challenges and collaboratively work together towards health and healing. She believes that no single approach is the right one for every individual and has been trained in a range of evidence-based practices. 
Amanda has worked with children, teens, adults, and families who are experiencing a range of different behaviors and emotions. Some of which clients and families who are battling obstacles related to Autism, Physical/Intellectual Disabilities, Traumatic Brain Injuries, and/or Trauma. She has had the opportunity to work in homes, schools and one-on-one within an office setting, all which have helped her to expand her knowledgebase.
Located in rural, central Pennsylvania, Amanda has a MS in Elementary Education, and is working to obtain her MA in Clinical Mental Health Counseling. She is married to her best friend, has two beautiful daughters and a loving, supportive family. She loves gardening, including all things that are related to growing vegetables, flowers, and herbs. She enjoys yoga, reading, being creative, and spending time with her family. She loves working in mental health, and loves the challenges in working to help her clients find their self-worth, purpose in learning how to be their best self. ''',
        rating: "4.2",
        reviews: "290",
        noOfPatients: "678",
        yearsOfExperience: "18",
        department: "Providers"),
  ];
  List<Doctor> filteredDoctors = [];
  List<String> specaialty = [
    "All",
    "Executive Management",
    "Management",
    "Providers",
  ];

  // void getDoctors() {
  //   emit(DoctorsState.loaded(doctors: doctors));
  // }

  void filterDoctorsBySpecialty(String specialty) {
    if (specialty == 'All') {
      emit(DoctorsState.loaded(doctors: doctors));
    } else if (specialty.isEmpty) {
      emit(DoctorsState.loaded(doctors: doctors));
    } else {
      filteredDoctors =
          doctors.where((doctor) => doctor.department == specialty).toList();
      emit(DoctorsState.loaded(doctors: filteredDoctors));
    }
  }
}
