

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class DateUtil {

  DateUtil._();

  static DateFormatter formatter(String pattern) {
    return DateFormatter('yy.M.d');
  }

}

final class DateFormatter {

  final String pattern;

  final DateFormat _dateFormat;

  DateFormatter(this.pattern) : _dateFormat = DateFormat(pattern);

  String date(DateTime dateTime) {
    return _dateFormat.format(dateTime);
  }

  (String startedOn, String endedOn) range(DateTimeRange range) {
    return (date(range.start), date(range.end));
  }

}