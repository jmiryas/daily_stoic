import 'package:intl/intl.dart';

String getDayOrdinal(int day) {
  if (day == 1) {
    return "st";
  } else if (day == 2) {
    return "nd";
  } else if (day == 3) {
    return "rd";
  } else {
    return "th";
  }
}

String getFormattedDate(DateTime date) {
  String day = date.day.toString();
  String month = DateFormat.MMMM().format(date);
  String dayOrdinal = getDayOrdinal(date.day);

  return "$month, $day$dayOrdinal";
}
