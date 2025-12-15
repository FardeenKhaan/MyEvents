import 'package:intl/intl.dart';

class FkTimeHelpers {

  static String formatDateTime(DateTime date) {
    if (date.millisecondsSinceEpoch == 0) return "N/A";
    return DateFormat('dd MMM yyyy').format(date);
  }
}