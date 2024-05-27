import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    
    if (text.length == 0) {
      return newValue;
    }

    // Validate month
    if (text.length == 1 && int.parse(text) > 1) {
      return oldValue;
    }
    
    if (text.length == 2) {
      int month = int.parse(text.substring(0, 2));
      if (month < 1 || month > 12) {
        return oldValue;
      }
    }

    // Validate day
    if (text.length == 4 && int.parse(text.substring(3)) > 3) {
      return oldValue;
    }
    
    if (text.length == 5) {
      int day = int.parse(text.substring(3, 5));
      if (day < 1 || day > 31) {
        return oldValue;
      }
    }

    // Ensure proper format
    if (text.length == 2) {
      return TextEditingValue(
        text: text + '/',
        selection: TextSelection.collapsed(offset: 3),
      );
    }
    
    if (text.length == 5) {
      return TextEditingValue(
        text: text + '/',
        selection: TextSelection.collapsed(offset: 6),
      );
    }

    return newValue;
  }
}
