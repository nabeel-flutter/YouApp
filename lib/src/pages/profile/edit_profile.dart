import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/gender_selection.dart';
import 'package:new_beginnings/src/pages/profile/payment_selection.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controlller = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;

    return PrimaryBackground(
        isAppBar: false,
        body: SingleChildScrollView(
          child: Stack(children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: BottomConcaveClipper(),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    color: Color(0xff0A7E80),
                  ),
                ),
              ],
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 8,
                left: 0,
                right: 0,
                child: UserProfileComponent()),
            Padding(
              padding:
                  EdgeInsets.only(top: screenWidth * 1.0, left: 16, right: 16),
              child: Container(
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
                          textList: const ["USA", "Pakistan", "London"],
                          onTapped: (p0) {},
                          title: "Select your Country"),
                      ExpandedSelectionWidget(
                          label: "State",
                          textList: const ["USA", "Pakistan", "London"],
                          onTapped: (p0) {
                            setState(() {});
                          },
                          title: "Select your State"),
                      ExpandedSelectionWidget(
                          label: "City",
                          textList: const ["USA", "Pakistan", "London"],
                          onTapped: (p0) {},
                          title: "Select your City"),
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
                      UploadInsuranceCard(
                        text: 'Upload front side of Card',
                        onPressed: () {},
                      ),
                      UploadInsuranceCard(
                        text: 'Upload back side of Card',
                        showlabeltext: false,
                        onPressed: () {},
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
            ),
          ]),
        ),
        isBackAppBar: false,
        appbarText: StringConstants.edit);
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
    );
  }
}

class UploadInsuranceCard extends StatelessWidget {
  final bool? showlabeltext;
  final VoidCallback onPressed;
  final String text;
  const UploadInsuranceCard({
    super.key,
    required this.text,
    this.showlabeltext = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            showlabeltext! ? "Upload Images of Insurance Card" : "",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff403B3B)),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xff80BCBD).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorConstants.greenish, // Set border color here
                width: 2.0, // Set border width here
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: Image.asset(
                    AssetsConstants.uploadimageicon,
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(text),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    AssetsConstants.uploadicon,
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          )
        ],
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  final String feildName;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFeild({
    super.key,
    required this.feildName,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          feildName,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff403B3B)),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 21.0, horizontal: 10), // Adjust the vertical p
              filled: true,
              fillColor: const Color(0xff80BCBD).withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: ColorConstants.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: ColorConstants
                        .primaryColor), // Set the constant outline color here
              ),
              // The focusedBorder property will define the appearance of the border when the TextField is focused
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: ColorConstants
                        .primaryColor), // And also set the same color here if you want
              ),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14)),
        ),
        const SizedBox(
          height: 14,
        )
      ],
    );
  }
}
