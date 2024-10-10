import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/localization/enums/locale_enums.dart';

///Application Localization Constants
@immutable
final class LocaleConstants {
  const LocaleConstants._();

  static List<Locale> supportedLocales =
      Locales.values.map((e) => e.locale).toList();
}
