import 'dart:convert';

import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/edit_profile_components.dart';
import 'package:new_beginnings/src/pages/profile/gender_selection.dart';
import 'package:new_beginnings/src/pages/profile/model/userdata_model.dart';
import 'package:new_beginnings/src/pages/profile/payment_selection.dart';
import 'package:http/http.dart' as http;

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
  TextEditingController firstnamecontrolller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController suffixcontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController ssncontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController alternatephonenumcontroller = TextEditingController();
  TextEditingController nameofinsurancecontroller = TextEditingController();
  TextEditingController insurancepolicycontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    var url = Uri.parse(
        'http://ec2-54-164-108-167.compute-1.amazonaws.com:7000/api/v1/user');

    // This is your session ID cookie. Replace the value with your actual session ID.
    String sessionId =
        'connect.sid=s%3AYG-TIONIidwhKEXgIZwwqzfAlNZZKZEl.gFHO1xjPp31PAdpZ2DYJv%2BWw1m%2FgjILaYlzfxqYUBaY;token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWMyMDI0NTM4ZTQ1M2E5YWIwMTg0OSIsImlhdCI6MTcxMDE0ODY1MiwiZXhwIjoxNzEwMzIxNDUyfQ.dLnV94RV9tB4_HFm1zV6irNnWqTW3rOIdv0f0XM0DM4';

    Map<String, String> headers = {
      'Cookie': sessionId,
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        UserDetails userDetails = UserDetails.fromJson(jsonResponse);
        setState(() {
          firstnamecontrolller.text = userDetails.data?.firstName ?? '';
          lastnamecontroller.text = userDetails.data?.lastName ?? '';
          emailcontroller.text = userDetails.data?.email ?? "";
          suffixcontroller.text = userDetails.data?.suffix ?? "";
          dobcontroller.text = userDetails.data?.birthDate ?? "";
          ssncontroller.text = userDetails.data?.ssn ?? "";
          addresscontroller.text = userDetails.data?.geoLocation?.address ?? "";
          zipcodecontroller.text = userDetails.data?.geoLocation?.zip ?? "";
          alternatephonenumcontroller.text =
              userDetails.data?.alternatePhone ?? "";
          insurancepolicycontroller.text =
              userDetails.data?.insuranceDetails?.insuranceName ?? "";
          insurancepolicycontroller.text =
              userDetails.data?.insuranceDetails?.insurancePolicy ?? "";
        });
        print('User Details: ${response.body}');
      } else {
        print(
            'Failed to load user details with status code: ${response.statusCode}');
        if (response.statusCode == 401) {
          // Handle unauthorized error
          print('Unauthorized: ${response.body}');
        }
      }
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  Widget build(BuildContext context) {
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
                child: UserProfileComponent(
                  userName: firstnamecontrolller.text,
                  userEmail: emailcontroller.text,
                )),
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
                        controller: firstnamecontrolller),
                    CustomTextFeild(
                        feildName: "Last Name",
                        hintText: "Enter your Last Name",
                        controller: lastnamecontroller),
                    CustomTextFeild(
                        feildName: "Suffix",
                        hintText: "Enter your Suffix",
                        controller: suffixcontroller),
                    CustomTextFeild(
                        feildName: "Date of Birth",
                        hintText: "Enter your Date of Birth",
                        controller: dobcontroller),
                    CustomTextFeild(
                        feildName: "SSN",
                        hintText: "Enter your SSN",
                        controller: ssncontroller),
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
                        feildName: StringConstants.address,
                        hintText: "Enter your Address",
                        controller: addresscontroller),
                    CustomTextFeild(
                        feildName: StringConstants.zipCode,
                        hintText: "Enter your Zip Code",
                        controller: zipcodecontroller),
                    CustomTextFeild(
                        feildName: StringConstants.email,
                        hintText: "Enter your Email",
                        controller: emailcontroller),
                    CustomTextFeild(
                        feildName: StringConstants.alternatephonenumber,
                        hintText: "Enter your Alternate Phone Number",
                        controller: alternatephonenumcontroller),
                    const PaymentSelection(),
                    const SizedBox(height: 24),
                    HeadingText(text: StringConstants.insurancedetails),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                        feildName: StringConstants.insuranceName,
                        hintText: "Enter Name of Insurance",
                        controller: nameofinsurancecontroller),
                    CustomTextFeild(
                        feildName: StringConstants.insurancepolicy,
                        hintText: "Enter Insurance Policy",
                        controller: insurancepolicycontroller),
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
