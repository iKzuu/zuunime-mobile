import 'package:intl/intl.dart';

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

String formatNumber(num? number) {
  if (number == null) return "-";
  final formatter = NumberFormat("#,###", "id_ID");
  return formatter.format(number);
}

String formatDecimal(num? number, {int fractionDigits = 2}) {
  if (number == null) return "-";
  return number.toStringAsFixed(fractionDigits);
}

String formatDate(DateTime? date) {
  if(date == null) return "-";
  final formatter = DateFormat("MMMM d, yyyy");
  return formatter.format(date);
}
