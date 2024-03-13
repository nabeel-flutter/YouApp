import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/cubit/user_profile_cubit.dart';
import 'package:new_beginnings/src/pages/profile/edit_profile_components.dart';
import 'package:new_beginnings/src/pages/profile/gender_selection.dart';
import 'package:new_beginnings/src/pages/profile/model/userdata_model.dart';
import 'package:new_beginnings/src/pages/profile/payment_selection.dart';

import '../appointment/views/widgets/expanded_selection_widget.dart';

class EditScreenBody extends StatefulWidget {
  final UserDetails? userDetails;

  const EditScreenBody({super.key, this.userDetails});

  @override
  State<EditScreenBody> createState() => _EditScreenBodyState();
}

class _EditScreenBodyState extends State<EditScreenBody> {
  bool _isInsured = true; // Add this line

  String state = 'California';

  String country = 'USA';
  String preferredLocation = "Preferred Location For Service";

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

  File? insuranceCardFront;
  File? insuranceCardBack;

  @override
  void initState() {
    super.initState();
    if (widget.userDetails != null) {
      updateControllers();
    }
  }

  void updateControllers() {
    firstnamecontrolller.text = widget.userDetails!.data!.firstName ?? '';
    lastnamecontroller.text = widget.userDetails!.data!.lastName ?? '';
    emailcontroller.text = widget.userDetails!.data!.email ?? '';
    suffixcontroller.text = widget.userDetails!.data!.suffix ?? "";
    dobcontroller.text = widget.userDetails!.data!.birthDate ?? "";
    ssncontroller.text = widget.userDetails!.data!.ssn ?? " ";
    addresscontroller.text =
        widget.userDetails!.data!.geoLocation!.address ?? "";
    zipcodecontroller.text = widget.userDetails!.data!.geoLocation!.zip ?? "";
    alternatephonenumcontroller.text =
        widget.userDetails!.data!.alternatePhone ?? "";
    nameofinsurancecontroller.text =
        widget.userDetails!.data!.insuranceDetails!.insuranceName ?? "";
    insurancepolicycontroller.text =
        widget.userDetails!.data!.insuranceDetails!.insurancePolicy ?? "";
  }

  @override
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
                  userName:
                      "${firstnamecontrolller.text}  ${lastnamecontroller.text}",
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
                    GenderSelection(
                      initialPaymentMode:
                          widget.userDetails?.data?.paymentType ?? "",
                    ),
                    const SizedBox(height: 24),
                    ExpandedSelectionWidget(
                      label: "Country",
                      textList: const ["USA", "Canada", "Mexico"],
                      onTapped: (selectedCountry) {
                        setState(() {
                          // Assuming you have a mechanism to update the userDetails with the new selection
                          country = selectedCountry;
                        });
                      },
                      title: widget.userDetails?.data?.geoLocation?.country
                                  ?.isNotEmpty ==
                              true
                          ? widget.userDetails!.data!.geoLocation!.country!
                          : "Select your country",
                    ),
                    ExpandedSelectionWidget(
                      label: "State",
                      textList: const [
                        "California",
                        "Texas",
                        "Florida",
                        "Massachusetts"
                      ],
                      onTapped: (selectedState) {
                        setState(() {
                          this.state = selectedState;
                        });
                      },
                      // Make sure to provide a non-nullable string by using ?? with a non-nullable default value
                      title: widget.userDetails?.data?.geoLocation?.state
                                  ?.isNotEmpty ==
                              true
                          ? widget.userDetails!.data!.geoLocation!.state!
                          : "Select your state",
                    ),
                    ExpandedSelectionWidget(
                      label: "City",
                      textList: const [
                        "New York City",
                        "Los Angeles",
                        "Chicago",
                        "Houston",
                      ],
                      onTapped: (city) {
                        setState(() {
                          this.city = city;
                        });
                      },
                      title: widget.userDetails?.data?.geoLocation?.city
                                  ?.isNotEmpty ==
                              true
                          ? widget.userDetails!.data!.geoLocation!.city!
                          : "Select your city",
                    ),
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
                    PaymentSelection(
                      initialPaymentMode:
                          widget.userDetails?.data?.paymentType ?? "",
                      onSelectionChange: (bool isInsured) {
                        setState(() {
                          _isInsured = isInsured;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    _isInsured
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingText(
                                  text: StringConstants.insurancedetails),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFeild(
                                  feildName: StringConstants.insuranceName,
                                  hintText: "Enter Name of Insurance",
                                  controller: nameofinsurancecontroller),
                              CustomTextFeild(
                                  feildName: "Insurance Policy",
                                  hintText: "Enter Insurance Policy",
                                  controller: insurancepolicycontroller),
                              UploadInsuranceCard(
                                onFileSelected: (file) {
                                  insuranceCardFront = file;
                                },
                                text: 'Upload front side of Card',
                              ),
                              UploadInsuranceCard(
                                onFileSelected: (file) {
                                  insuranceCardBack = file;
                                },
                                text: 'Upload back side of Card',
                                showlabeltext: false,
                              ),
                            ],
                          )
                        : Container(),
                    ExpandedSelectionWidget(
                      onTapped: (preferredLocation) {
                        setState(() {
                          this.preferredLocation = preferredLocation;
                        });
                      },
                      title: widget.userDetails?.data?.preferredLocation
                                  ?.isNotEmpty ==
                              true
                          ? widget.userDetails!.data!.preferredLocation!
                          : "Select Preferred Location For Service",
                      label: "Preferred Location For Service",
                      textList: const [
                        '1 W. Centre St Mahanoy, PA 17948',
                        '18151 W. End Ave Pottsville, PA 17901',
                        '564 Main St.Stroudsbrug, PA 18360',
                        '130 White Horse Pike Clementon, NJ 08021'
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Button(
                      label: 'Save',
                      onPressed: () {
                        BlocProvider.of<UserProfileCubit>(context).updateUser(
                          email: emailcontroller.text,
                          firstName: firstnamecontrolller.text,
                          lastName: lastnamecontroller.text,
                          insuranceCardFront: insuranceCardFront,
                          insuranceCardBack: insuranceCardBack,
                        );
                      },
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
