import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/profile/cubit/user_profile_cubit.dart';
import 'package:new_beginnings/src/pages/profile/edit_profile_components.dart';
import 'package:new_beginnings/src/pages/profile/gender_selection.dart';
import 'package:new_beginnings/src/pages/profile/model/user_data_model.dart';
import 'package:new_beginnings/src/pages/profile/payment_selection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'package:new_beginnings/src/pages/appointment/views/widgets/expanded_selection_widget.dart';

class EditScreenBody extends StatefulWidget {
  final UserDetails? userDetails;

  const EditScreenBody({super.key, this.userDetails});

  @override
  State<EditScreenBody> createState() => _EditScreenBodyState();
}

class _EditScreenBodyState extends State<EditScreenBody> {
  bool _isInsured = true; // Add this line

  String state = 'California';
  String? selectedGenderValue;
  String selectedPaymentValue = "";

  String country = 'USA';
  String? preferredLocation;

  String city = 'New York';
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController suffixController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  TextEditingController ssnController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController zipCodeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController alternatePhoneNumController = TextEditingController();

  TextEditingController nameOfInsuranceController = TextEditingController();

  TextEditingController insurancePolicyController = TextEditingController();

  File? insuranceCardFront;
  File? insuranceCardBack;
  File? avatar;

  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.userDetails != null) {
      updateControllers();
    }
  }

  Future<void> updateControllers() async {
    _isInsured = widget.userDetails?.data?.paymentType == 'insured';
    selectedPaymentValue = widget.userDetails?.data?.paymentType ?? '';
    firstNameController.text = widget.userDetails!.data!.firstName ?? '';
    lastNameController.text = widget.userDetails!.data!.lastName ?? '';
    emailController.text = widget.userDetails!.data!.email ?? '';
    suffixController.text = widget.userDetails!.data!.suffix ?? "";
    dobController.text = widget.userDetails!.data!.birthDate ?? "";
    ssnController.text = widget.userDetails!.data!.ssn ?? " ";
    addressController.text =
        widget.userDetails!.data!.geoLocation!.address ?? "";
    zipCodeController.text = widget.userDetails!.data!.geoLocation!.zip ?? "";
    phoneNumberController.text = widget.userDetails!.data!.phone ?? "";
    alternatePhoneNumController.text =
        widget.userDetails!.data!.alternatePhone ?? "";
    nameOfInsuranceController.text =
        widget.userDetails!.data!.insuranceDetails!.insuranceName ?? "";
    insurancePolicyController.text =
        widget.userDetails!.data!.insuranceDetails!.insurancePolicy ?? "";
    avatar = await saveImage(widget.userDetails!.data!.avatar);
    insuranceCardFront =
        await saveImage(widget.userDetails!.data!.insuranceDetails!.frontPic);
    insuranceCardBack = await saveImage(// Add this line
        widget.userDetails!.data!.insuranceDetails!.backPic);
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
                  image: widget.userDetails != null
                      ? widget.userDetails!.data!.avatar!.isNotEmpty
                          ? widget.userDetails!.data!.avatar
                          : null
                      : null,
                  userName:
                      "${firstNameController.text} ${lastNameController.text}",
                  userEmail: emailController.text,
                  onImageSelected: (File) {
                    avatar = File;
                  },
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
                    CustomTextField(
                      fieldName: "First Name",
                      hintText: "Enter your First Name",
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                    ),
                    CustomTextField(
                        keyboardType: TextInputType.name,
                        fieldName: "Last Name",
                        hintText: "Enter your Last Name",
                        controller: lastNameController),
                    CustomTextField(
                        keyboardType: TextInputType.name,
                        fieldName: "Suffix",
                        hintText: "Enter your Suffix",
                        controller: suffixController),
                    // CustomTextField(
                    //     fieldName: "Date of Birth",
                    //     hintText: "Enter your Date of Birth",
                    //     controller: dobController),
                    DateSelectionWidget(
                      initialDate: widget.userDetails?.data?.birthDate,
                      onDateSelected: (selectedDate) {
                        setState(() {
                          dobController.text = selectedDate!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    CustomTextField(
                        keyboardType: TextInputType.phone,
                        fieldName: "SSN",
                        hintText: "Enter your SSN",
                        controller: ssnController),
                    GenderSelection(
                      initialSelction: widget.userDetails?.data?.gender ?? "",
                      onGenderSelect: (selectedGender) {
                        setState(() {
                          selectedGenderValue = selectedGender;
                        });
                      },
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
                          state = selectedState;
                        });
                      },
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
                    CustomTextField(
                        fieldName: StringConstants.address,
                        hintText: "Enter your Address",
                        keyboardType: TextInputType.streetAddress,
                        controller: addressController),
                    CustomTextField(
                        fieldName: StringConstants.zipCode,
                        hintText: "Enter your Zip Code",
                        keyboardType: TextInputType.number,
                        controller: zipCodeController),
                    CustomTextField(
                        fieldName: StringConstants.email,
                        hintText: "Enter your Email",
                        isEnabled: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController),
                    CustomTextField(
                        fieldName: "Phone Number",
                        hintText: "Enter your Phone Number",
                        keyboardType: TextInputType.number,
                        controller: phoneNumberController),
                    CustomTextField(
                        fieldName: StringConstants.alternatephonenumber,
                        hintText: "Enter your Alternate Phone Number",
                        keyboardType: TextInputType.number,
                        controller: alternatePhoneNumController),
                    PaymentSelection(
                      initialPaymentMode:
                          widget.userDetails?.data?.paymentType ?? "",
                      onSelectionChange: (bool isInsured) {
                        setState(() {
                          _isInsured = isInsured;
                        });
                      },
                      onPaymentSelect: (paymentvalue) {
                        setState(() {
                          selectedPaymentValue = paymentvalue;
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
                              CustomTextField(
                                  keyboardType: TextInputType.name,
                                  fieldName: StringConstants.insuranceName,
                                  hintText: "Enter Name of Insurance",
                                  controller: nameOfInsuranceController),
                              CustomTextField(
                                  fieldName: "Insurance Policy",
                                  keyboardType: TextInputType.name,
                                  hintText: "Enter Insurance Policy",
                                  controller: insurancePolicyController),
                              UploadInsuranceCard(
                                image:widget.userDetails!=null? widget.userDetails!.data!
                                        .insuranceDetails!.frontPic!.isNotEmpty
                                    ? widget.userDetails!.data!.insuranceDetails!.frontPic
                                    : null:null,
                                onFileSelected: (file) {
                                  insuranceCardFront = file;
                                },
                                text: 'Upload front side of Card',
                              ),
                              UploadInsuranceCard(
                                  image:widget.userDetails!=null? widget.userDetails!.data!
                                        .insuranceDetails!.backPic!.isNotEmpty
                                    ? widget.userDetails!.data!.insuranceDetails!.backPic
                                    : null:null,
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
                          if (selectedPaymentValue.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please select payment type'),
                            ));
                            return;
                          } else if (selectedPaymentValue == "insured" &&
                              (nameOfInsuranceController.text.isEmpty ||
                                  insurancePolicyController.text.isEmpty ||
                                  insuranceCardFront == null ||
                                  insuranceCardBack == null)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text('Please fill all the insurance details'),
                            ));
                            return;
                          } else {
                            BlocProvider.of<UserProfileCubit>(context)
                                .updateUser(
                              avatar: avatar,
                              email: emailController.text.trim(),
                              address: addressController.text,
                              alternatePhone:
                                  alternatePhoneNumController.text.trim(),
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              city: city,
                              state: state,
                              country: country,
                              dob: dobController.text.trim(),
                              zipCode: zipCodeController.text.trim(),
                              gender: selectedGenderValue ??
                                  widget.userDetails!.data!.gender,
                              ssn: ssnController.text.trim(),
                              suffix: suffixController.text.trim(),
                              prefferdLocation: preferredLocation ??
                                  widget.userDetails!.data!.preferredLocation,
                              phone: phoneNumberController.text.trim(),
                              paymentType: selectedPaymentValue,
                              insuranceCardBack: insuranceCardBack,
                              insuranceCardFront: insuranceCardFront,
                              insuranceName:
                                  nameOfInsuranceController.text.trim(),
                              insurancePoilcyNumber:
                                  insurancePolicyController.text.trim(),
                            );
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    const LogoutButton(),
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

  Future<File?> saveImage(String? avatar) async {
    if (avatar == null) {
      return null;
    } else {
      var response = await http.get(Uri.parse(avatar));
      if (response.statusCode == 200) {
        // Get the temporary directory path
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;

        // Create a temporary file
        File tempFile = File('$tempPath/temp_image.jpg');
        await tempFile.writeAsBytes(response.bodyBytes);

        return tempFile;
      }
    }
    return null;
  }
}
