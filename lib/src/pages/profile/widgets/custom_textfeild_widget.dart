import 'package:new_beginnings/src/app/app_export.dart';

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
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: const Color(0xff656567),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 21.0, horizontal: 10),
            filled: true,
            fillColor: ColorConstants.inputFeildBgColor.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorConstants.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorConstants.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorConstants.primaryColor),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xff656567),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
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
