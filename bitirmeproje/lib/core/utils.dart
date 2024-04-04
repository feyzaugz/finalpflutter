import 'package:intl/intl.dart';

class Utils {
  static currencyFormat(double amount) {
    return NumberFormat.simpleCurrency(locale: "tr", name: "TL").format(amount);
  }
}
