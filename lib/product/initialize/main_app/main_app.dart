import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/splash/view/splash_view.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: WidgetSizes.spacingZero,
        ),
        scaffoldBackgroundColor: ProductColors.backgroundColor,
        tabBarTheme: const TabBarTheme(
          labelColor: ProductColors.purple,
        ),
      ),
      home: const SplashView(),
    );
  }
}
