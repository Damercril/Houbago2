import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatFCFA(double amount) {
    final formatter = NumberFormat("#,###", "fr_FR");
    return "${formatter.format(amount)} FCFA";
  }

  static String formatNumber(double amount) {
    final formatter = NumberFormat("#,###", "fr_FR");
    return formatter.format(amount);
  }
}
