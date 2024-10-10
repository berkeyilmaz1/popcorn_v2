import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/onboarding/onboard/onboard_view.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: ProductConstants.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: ProductColors.backgroundColor,
      ),
      home: const OnboardView(),
    );
  }
}
