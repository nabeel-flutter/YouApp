import 'package:file_picker/file_picker.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'dart:math' as math;

class EditScreenTopComponent extends StatelessWidget {
  const EditScreenTopComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipPath(
            clipper: BottomConcaveClipper(),
            child: Container(
              height: 250,
              width: double.infinity,
              color: const Color(0xff0A7E80),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Ensure space is distributed evenly on both ends of the Row.
                    children: [
                      GestureDetector(
                        onTap: () => NavigationUtil.pop(context),
                        child: Container(
                            width: 32,
                            height: 32,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstants.white),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                              color: Color(0xff0A7E80),
                            )),
                      ),
                      const Expanded(
                        child: Text(
                          "Edit Profile",
                          textAlign: TextAlign
                              .center, // Center the text within its expanded space.
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Opacity(
                        opacity: 0.0, // Make the mirror widget invisible.
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
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

class UploadInsuranceCard extends StatefulWidget {
  final bool? showlabeltext;
  final String text;
  final Function(File?) onFileSelected;
  final String? image;

  const UploadInsuranceCard({
    Key? key,
    required this.text,
    this.showlabeltext = true,
    required this.onFileSelected,
    this.image,
  }) : super(key: key);

  @override
  State<UploadInsuranceCard> createState() => _UploadInsuranceCardState();
}

class _UploadInsuranceCardState extends State<UploadInsuranceCard> {
  File? _file; // This will hold the image file
  String? _fileName;
  String? _fileSize;

  Future<void> _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final PlatformFile pickedFile = result.files.first;

      setState(() {
        _file = File(pickedFile.path!);
        _fileName = pickedFile.name;
        _fileSize = _formatBytes(pickedFile.size, 2);
      });
      widget.onFileSelected(_file);
    }
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: _file != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.showlabeltext ?? true)
                  const Text(
                    "Uploaded Images of Insurance Card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff403B3B),
                    ),
                  ),
                const SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff80BCBD).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorConstants.greenish, // Set border color here
                        width: 2.0, // Set border width here
                      ),
                    ),
                    child: Image.file(_file!)),
              ],
            )
          : widget.image != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showlabeltext ?? true)
                      const Text(
                        "Uploaded Images of Insurance Card\n(Click image to change)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff403B3B),
                        ),
                      ),
                    const SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff80BCBD).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: ColorConstants
                                .greenish, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Image.network(
                          widget.image!,
                          fit: BoxFit.cover,
                        )),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showlabeltext ?? true)
                      const Text(
                        "Upload Images of Insurance Card",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff403B3B),
                        ),
                      ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                        color: const Color(0xff80BCBD).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              ColorConstants.greenish, // Set border color here
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
                          _file == null
                              ? Text(
                                  widget.text,
                                )
                              : Flexible(
                                  child: Text(
                                    "${_fileName!} ($_fileSize)",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                          const Spacer(),
                          _file == null
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Image.asset(
                                    AssetsConstants.uploadicon,
                                    width: 25,
                                    height: 25,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool isEnabled;
  const CustomTextField(
      {super.key,
      required this.fieldName,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: const TextStyle(
            color: ColorConstants.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          enabled: isEnabled,
          cursorColor: ColorConstants.primaryColor,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 21.0, horizontal: 10), // Adjust the vertical p
            filled: true,
            fillColor: const Color(0xff80BCBD).withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorConstants.primaryColor),
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
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xff656567),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const SizedBox(
          height: 14,
        )
      ],
    );
  }
}

class DateSelectionWidget extends StatefulWidget {
  final void Function(String?) onDateSelected;
  final String? initialDate; // Add this line

  const DateSelectionWidget({
    Key? key,
    required this.onDateSelected,
    this.initialDate, // Add this line
  }) : super(key: key);

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  late String selectedDateText; // Change this line

  @override
  void initState() {
    super.initState();
    // Set the initial selectedDateText based on the initialDate passed from the parent widget
    selectedDateText = widget.initialDate ?? "Select your date of birth";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDateText = DateFormat('yyyy-MM-dd').format(picked);
      });
      widget.onDateSelected(selectedDateText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of Birth",
          style: TextStyle(
            color: ColorConstants.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xff80BCBD).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorConstants.primaryColor,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: ColorConstants.greenish,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  selectedDateText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff656567),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
