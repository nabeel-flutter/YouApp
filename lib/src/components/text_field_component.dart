import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_finder/src/constant/color_constants.dart';
import 'package:e_finder/src/constant/font_constants.dart';
import 'package:e_finder/src/theme/get_theme_color.dart';

class TextFormFieldComponent extends StatefulWidget {
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
    this.errorText,
    this.borderColor,
    this.fillColor,
    this.borderRadius,
    this.stroke = 1,
    this.isLabel = false,
    required this.onChanged,
    this.onFieldSubmitted,
    required this.hintColor,
    required this.textColor,
    required this.lable,
     this.prefixIcon,
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
  final String? errorText;
  final Color? borderColor;
  final Color? fillColor;
  final double? borderRadius;
  final double? stroke;
  final bool? isLabel;
  final Color hintColor;
  final Color textColor;
  final String lable;
  final Widget? prefixIcon;

  final Function(String value) onChanged;
  final Function(String value)? onFieldSubmitted;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (widget.isLabel == true)
        Text(
          widget.label ?? '',
          style: const TextStyle(
            color: ColorConstants.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      Padding(
          padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
          child: TextFormField(
              keyboardType: widget.textInputType,
              strutStyle: const StrutStyle(
                height: 2,
              ),
              maxLines: widget.maxLines,
              onFieldSubmitted: (value) {
                widget.onFieldSubmitted!(value);
              },
              onChanged: (value) {
                widget.onChanged(value);
              },
              validator: (value) {
                return validator(
                    value: value, textInputType: widget.textInputType);
              },
              inputFormatters: widget.listTextInputFormatter,
              controller: widget.controller,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: FontConstants.gilroyMedium,
                    color: ColorConstants.black,
                  ),
              obscureText: widget.isPassword == true ? showPassword : false,
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,
                  label: Text(
                    widget.lable,
                    style: TextStyle(color: widget.lableColor),
                  ),
                  
                  suffixIcon: widget.isPassword == true
                      ? IconButton(
                          onPressed: () =>
                              setState(() => showPassword = !showPassword),
                          icon: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [
                                    Color(0xFF9747FF),
                                    Color(0xFF9747FF)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds);
                              },
                              child:
                                  Icon(showPassword ? Icons.visibility_off_outlined : Icons.visibility,
                                      color: ColorConstants.bgColorLight)))
                      : widget.suffixIcon,
                  focusColor: getThemeColor(context),
                  filled: true,
                  fillColor: widget.fillColor ?? ColorConstants.white,
                  hintText: widget.hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorConstants.hintTextColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.borderColor ??
                              ColorConstants.borderColorFields,
                          width: widget.stroke ?? 2.2),
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 20)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.borderColor ??
                              ColorConstants.borderColorFields,
                          width: widget.stroke ?? 2.2),
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 20)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.borderColor ??
                              ColorConstants.borderColorFields,
                          width: widget.stroke ?? 2.2),
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 20)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.borderColor ??
                            ColorConstants.borderColorFields,
                        width: widget.stroke ?? 2.2),
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 20),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: widget.borderColor ?? ColorConstants.borderColorFields, width: widget.stroke ?? 2.2),
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 20)))))
    ]);
  }

  String? validator({required TextInputType textInputType, String? value}) {
    if (value == null || value.isEmpty) {
      return widget.errorText ?? 'Please enter valid info';
    } else if (textInputType == TextInputType.emailAddress) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);
      return value.isNotEmpty && !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    } else if (textInputType == TextInputType.visiblePassword) {
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (value.isEmpty) {
        return 'Please enter password';
      } else {
        if (!regex.hasMatch(value)) {
          return 'Enter valid password\nMinimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character\nLength 8@\nCommon Allow Character ( ! @ # \$ & * ~ )';
        } else {
          return null;
        }
      }
    } else if (textInputType == TextInputType.name) {
      if (value.length < 3) {
        return 'Name is too short';
      }
    }
    return null;
  }
}
