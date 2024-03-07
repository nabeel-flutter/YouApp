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
    return PrimaryBackground(
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // const UserProfileComponent(),
            Padding(
              padding: EdgeInsets.only(right: 230.0),
              child: Text(
                "Personal Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            SizedBox(
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
            GenderSelection(),
            SizedBox(height: 24),
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
            PaymentSelection(),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(right: 220.0),
              child: Text(
                "Insurance Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            SizedBox(
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload Images of Insurance Card",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff403B3B)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff80BCBD).withOpacity(0.2),
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
                        Text("Upload front side of Card"),
                        Spacer(),
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
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ]),
        ),
        isBackAppBar: true,
        appbarText: StringConstants.edit);
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            feildName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff403B3B)),
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff80BCBD).withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorConstants.greenish),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: ColorConstants
                          .greenish), // Set the constant outline color here
                ),
                // The focusedBorder property will define the appearance of the border when the TextField is focused
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: ColorConstants
                          .greenish), // And also set the same color here if you want
                ),
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14)),
          ),
          SizedBox(
            height: 14,
          )
        ],
      ),
    );
  }
}
