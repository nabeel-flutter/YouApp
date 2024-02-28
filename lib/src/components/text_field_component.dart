import 'package:flutter/services.dart';
import 'package:new_beginnings/src/app/app_export.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.controller,
    this.listTextInputFormatter,
    this.label,
    this.maxLines = 1,
    this.hintText = '',
    this.verticalPadding = 8.0,
    this.lableColor = ColorConstants.greyText,
    this.textInputType = TextInputType.text,
    this.isPassword,
    this.suffixIcon,
  });
  final List<TextInputFormatter>? listTextInputFormatter;
  final String? label;
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  final double verticalPadding;
  final Color lableColor;
  final TextInputType textInputType;
  final bool? isPassword;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: TextFormField(
        keyboardType: textInputType,
        strutStyle: const StrutStyle(
          height: 1.3,
        ),
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        inputFormatters: listTextInputFormatter,
        controller: controller,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: FontConstantc.gilroyMedium,
            color: darken(
              getThemeColor(context),
              0.4,
            )),
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            focusColor: getThemeColor(context),
            filled: true,
            fillColor: ColorConstants.white,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: ColorConstants.hintTextColor),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorConstants.borderColorFields, width: 2.2),
                borderRadius: BorderRadius.circular(20)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorConstants.borderColorFields, width: 2.2),
                borderRadius: BorderRadius.circular(20)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorConstants.borderColorFields, width: 2.2),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: ColorConstants.borderColorFields, width: 2.2),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorConstants.borderColorFields, width: 2.2),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
