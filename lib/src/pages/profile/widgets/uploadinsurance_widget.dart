import 'package:file_picker/file_picker.dart';
import 'package:your_app_test/src/app/app_export.dart';
import 'dart:math' as math;

class UploadInsuranceCard extends StatefulWidget {
  final bool? showLabelText;
  final String text;
  final Function(File?) onFileSelected;
  final String? image;

  const UploadInsuranceCard({
    Key? key,
    required this.text,
    this.showLabelText = true,
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
                if (widget.showLabelText ?? true)
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
                        color: ColorConstants
                            .primaryColor, // Set border color here
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
                    if (widget.showLabelText ?? true)
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
                                .primaryColor, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Image.network(widget.image!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Text("Image not found"),
                                ))),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showLabelText ?? true)
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
                          color: ColorConstants
                              .primaryColor, // Set border color here
                          width: 1.0, // Set border width here
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8),
                            child: Image.asset(
                              AssetsConstants.uploadImageIcon,
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
                                    AssetsConstants.uploadIcon,
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
