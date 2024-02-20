import 'package:intl/intl.dart';

class DateTimeUtil {
  ///
  /// Date Time Util
  ///

  String timeStampToFormattedDate(int timeStamp) {
    try {
      final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000).toUtc();
      String formattedDate = DateFormat('dd MMM hh:mm a').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatDate(DateTime dateTime, String dateFormat) {
    try {
      String formattedDate = DateFormat(dateFormat).format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatDateAndTime(
    String dateTime, {
    String format = 'yyyy-MM-dd h:mm:ss',
    String outPutFormat = 'MMM dd, yyyy',
  }) {
    try {
      DateTime parseDate = DateFormat(format).parse(dateTime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat(outPutFormat);
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    } catch (e) {
      return dateTime;
    }
  }
}
