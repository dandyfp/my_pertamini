import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../constans/config.dart';
import '../constans/navigator_key.dart';

class FormatDate {
  String formatDate(date, {format = 'EEE, dd MMM yyyy', context}) {
    initializeDateFormatting();
    return DateFormat(format, Config.localeID).format(
      DateTime.parse(date).toLocal(),
    );
  }

  String formatTime(date, context) {
    initializeDateFormatting();
    return DateFormat.jm(Localizations.localeOf(context ?? navigatorKey.currentContext).languageCode).format(
      DateTime.parse(date).toLocal(),
    );
  }

  String formatTime24(date, context) {
    initializeDateFormatting();
    return DateFormat.Hm(Localizations.localeOf(context ?? navigatorKey.currentContext).languageCode).format(
      DateTime.parse(date).toLocal(),
    );
  }

  String isTodayOrTommorow(date, context) {
    initializeDateFormatting();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final dateToCheck = date;
    final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    String code = Localizations.localeOf(context ?? navigatorKey.currentContext).languageCode;
    if (code == 'id') {
      if (aDate == today) {
        return 'Hari ini,';
      } else if (aDate == tomorrow) {
        return 'Besok,';
      } else {
        return '';
      }
    } else {
      if (aDate == today) {
        return 'Today,';
      } else if (aDate == tomorrow) {
        return 'Tomorrow,';
      } else {
        return '';
      }
    }
  }

  String formatDashboard(date, context) {
    initializeDateFormatting();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final dateToCheck = date;
    final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == today) {
      return 'Today at ${formatDate(date.toString(), format: 'h:mm a', context: context ?? navigatorKey.currentContext)}';
    } else if (aDate == tomorrow) {
      return 'Tomorrow at ${formatDate(date.toString(), format: 'h:mm a', context: context ?? navigatorKey.currentContext)}';
    } else {
      return formatDate(date.toString(), context: context ?? navigatorKey.currentContext);
    }
  }
}
