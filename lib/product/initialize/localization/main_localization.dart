import 'package:easy_localization/easy_localization.dart';
import 'package:popcorn_v2/product/initialize/localization/enums/locale_enums.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_constants.dart'; 

final class MainLocalization extends EasyLocalization {
  MainLocalization({
    required super.child,
    super.key,
  }) : super(
          path: localizationPath,
          useOnlyLangCode: true,
          supportedLocales: LocaleConstants.supportedLocales,
          fallbackLocale: Locales.en.locale,
        );

  static const String localizationPath = 'assets/translations';
}