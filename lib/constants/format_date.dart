//DATE FORMAT
import 'package:intl/intl.dart';

String formatDate(String? inputDate) {
  try {
    DateTime date = DateTime.parse(inputDate.toString());
    String formattedDate = DateFormat("dd MMM yyyy").format(date);
    return formattedDate;
  } catch (e) {
    return "";
  }
}
