import 'package:intl/intl.dart';

class DateTimeUtils {

  static DateTime parseDateTime(String dateTimeString) {
    return DateFormat('EEEE, MMMM d, y').parse(dateTimeString);
  }

  static String timeAgo(String  dateTimeString) {
    DateTime parsedDateTime = parseDateTime(dateTimeString);

    DateTime now = DateTime.now();
    Duration difference = now.difference(parsedDateTime);
    if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays > 1 && difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 7 && difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays >= 30 && difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays >= 365) {
      int years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else {
      return 'Today';
    }
  }
}