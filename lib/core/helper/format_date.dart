import 'package:intl/intl.dart';

String formatTime(DateTime? dateTime) {
  if (dateTime == null) return '';
  
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  if (messageDate == today) {
    return DateFormat('hh:mm a').format(dateTime); // 10:30 AM
  } else if (messageDate == today.subtract(const Duration(days: 1))) {
    return 'Yesterday'; // أو 'أمس'
  } else {
    return DateFormat('yyyy/MM/dd').format(dateTime); // 2026/08/26
  }
}