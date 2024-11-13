import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@Riverpod(keepAlive: true)
class LocaleState extends _$LocaleState {

  @override
  Locale build() {
    return _create(Platform.localeName);
  }

  void change(String localeName) {
    state = _create(localeName);
  }

  Locale _create(String localeName) {
    final languageCode = Intl.shortLocale(localeName);
    return Locale.fromSubtags(languageCode: languageCode);
  }

}