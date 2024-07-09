import 'package:intl/intl.dart';

final class CustomDateTime {
  static String fomatterDate({required String date, required String pattern}) {
    return DateFormat(pattern).format(DateTime.parse(date));
  }
}
