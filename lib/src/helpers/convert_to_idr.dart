import 'package:intl/intl.dart';

String convertToIdr(int number) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'IDR ',
    decimalDigits: 0,
  );
  return currencyFormatter.format(number);
}

String convertToRP(int number) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return currencyFormatter.format(number);
}

String convertToIdrWithoutRP(int number) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: '',
    decimalDigits: 0,
  );
  return currencyFormatter.format(number);
}

String convertAmount(int amount) {
  if (amount >= 1000 && amount < 1000000) {
    double value = amount / 1000;
    return "${value.toStringAsFixed(0)}k";
  } else if (amount >= 1000000) {
    double value = amount / 1000000;
    return "${value.toStringAsFixed(1)}M";
  } else {
    return amount.toString();
  }
}
