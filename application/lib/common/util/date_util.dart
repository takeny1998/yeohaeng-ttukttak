

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class DateUtil {

  DateUtil._();

  static DateFormatter formatter(String pattern) {
    return DateFormatter(pattern);
  }
  
  static String formatRange(DateTimeRange range) {
    
    final formatter = DateUtil.formatter('yy.M.c');
    final DateTimeRange(:start, :end) = range;
    
    if (DateUtils.isSameMonth(start, end)) {
      return '${formatter.date(start)} - ${DateUtil.formatter('c').date(end)}';
    }

    // 두 날짜의 연도는 같지만, 달이 다른 경우
    if (start.year == end.year) {
      return '${formatter.date(start)} - ${DateUtil.formatter('M.c').date(end)}';
    }

    // 두 날짜의 연도가 다른 경우
    return '${formatter.date(start)} - ${formatter.date(end)}';

  }

  static bool isInRange(DateTime date, DateTime start, DateTime end) {

    return (start.isAtSameMomentAs(date) || date.isAfter(start)) &&
        (end.isAtSameMomentAs(date) || date.isBefore(end));
  }

}

final class DateFormatter {

  final String pattern;

  final DateFormat _dateFormat;

  DateFormatter(this.pattern) : _dateFormat = DateFormat(pattern);

  String date(DateTime dateTime) {
    return _dateFormat.format(dateTime);
  }

  (String start, String end) range(DateTimeRange range) {
    return (date(range.start), date(range.end));
  }

}