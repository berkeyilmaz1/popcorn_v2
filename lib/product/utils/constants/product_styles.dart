import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';

final class ProductStyles {
  static final instance = ProductStyles();
  TextStyle get onboardTitle => const TextStyle(
        color: ProductColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get onboardDescription => const TextStyle(
        color: ProductColors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  TextStyle get onboardSkip => const TextStyle(
        color: ProductColors.purple,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get orDivider => const TextStyle(
        color: Colors.grey,
        fontSize: 18,
      );

  TextStyle get authButton => const TextStyle(
        color: ProductColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get appTitle => const TextStyle(
        color: ProductColors.white,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      );


   
}
