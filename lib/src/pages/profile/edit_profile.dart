import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/edit_profile_components.dart';
import 'package:new_beginnings/src/pages/profile/gender_selection.dart';
import 'package:new_beginnings/src/pages/profile/payment_selection.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String state = 'California';
  String country = 'USA';
  String city = 'New York';

  Widget build(BuildContext context) {
    TextEditingController controlller = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;

    return PrimaryBackground(
        isAppBar: false,
        body: SingleChildScrollView(
          child: Stack(children: [
            const EditScreenTopComponent(),
            Positioned(
                top: MediaQuery.of(context).size.height / 7,
                left: 0,
                right: 0,
                child: const UserProfileComponent()),
            Padding(
              padding:
                  EdgeInsets.only(top: screenWidth * 1.0, left: 16, right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    const HeadingText(
                      text: "Personal Details",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                        feildName: "First Name",
                        hintText: "Enter your First Name",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Last Name",
                        hintText: "Enter your Last Name",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Suffix",
                        hintText: "Enter your Suffix",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Date of Birth",
                        hintText: "Enter your Date of Birth",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "SSN",
                        hintText: "Enter your SSN",
                        controller: controlller),
                    const GenderSelection(),
                    const SizedBox(height: 24),
                    ExpandedSelectionWidget(
                        label: "Country",
                        textList: const [
                          "USA",
                          "Canada",
                          "Mexico",
                          "Guatemala",
                          "Belize",
                          "El Salvador",
                          "Honduras",
                          "Nicaragua",
                          "Costa Rica",
                          "Panama",
                          "Cuba",
                          "Jamaica",
                          "Haiti",
                          "Dominican Republic",
                          "Bahamas"
                        ],
                        onTapped: (country) {
                          setState(() {
                            this.country = country;
                          });
                        },
                        title: country),
                    ExpandedSelectionWidget(
                        label: "State",
                        textList: const [
                          "California",
                          "Texas",
                          "Florida",
                          "New York",
                          "Pennsylvania",
                          "Illinois",
                          "Ohio",
                          "Georgia",
                          "North Carolina",
                          "Michigan",
                          "New Jersey",
                          "Virginia",
                          "Washington",
                          "Arizona",
                          "Massachusetts"
                        ],
                        onTapped: (state) {
                          setState(() {
                            this.state = state;
                          });
                        },
                        title: state),
                    ExpandedSelectionWidget(
                        label: "City",
                        textList: const [
                          "New York City",
                          "Los Angeles",
                          "Chicago",
                          "Houston",
                          "Phoenix",
                          "Philadelphia",
                          "San Antonio",
                          "San Diego",
                          "Dallas",
                          "San Jose",
                          "Austin",
                          "Jacksonville",
                          "San Francisco",
                          "Indianapolis",
                          "Seattle"
                        ],
                        onTapped: (city) {
                          setState(() {
                            this.city = city;
                          });
                        },
                        title: city),
                    CustomTextFeild(
                        feildName: "Address",
                        hintText: "Enter your Address",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Zip Code",
                        hintText: "Enter your Zip Code",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Email",
                        hintText: "Enter your Email",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Alternate Phone Number",
                        hintText: "Enter your Alternate Phone Number",
                        controller: controlller),
                    const PaymentSelection(),
                    const SizedBox(height: 24),
                    const HeadingText(text: "Insurance Details"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                        feildName: "Name of Insurance",
                        hintText: "Enter Name of Insurance",
                        controller: controlller),
                    CustomTextFeild(
                        feildName: "Insurance Policy #",
                        hintText: "Enter Insurance Policy",
                        controller: controlller),
                    const UploadInsuranceCard(
                      text: 'Upload front side of Card',
                    ),
                    const UploadInsuranceCard(
                      text: 'Upload back side of Card',
                      showlabeltext: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Button(
                      label: 'Save',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Logoutbutton(),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
            ),
          ]),
        ),
        isBackAppBar: false,
        appbarText: StringConstants.edit);
  }
}
