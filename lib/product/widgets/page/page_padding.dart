import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

class PagePadding extends EdgeInsets {
  /// Padding is 16
  const PagePadding.horizontal16Symmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingM);

  /// Padding is 18
  const PagePadding.vertical18Symmetric()
      : super.symmetric(vertical: WidgetSizes.spacingMx);

  /// Padding is 40
  const PagePadding.horizontal40Symmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingXxl4);

  /// Padding is 24
  const PagePadding.horizontal24Symmetric()
      : super.symmetric(vertical: WidgetSizes.spacingXl);

  /// Padding is 10
  const PagePadding.allLow() : super.all(WidgetSizes.spacingXSmall);

  /// Padding is 20
  const PagePadding.all() : super.all(WidgetSizes.spacingL);

  /// Padding is 24
  const PagePadding.allNormal() : super.all(WidgetSizes.spacingXl);

  /// value is 24
  const PagePadding.onlyBottomNormal()
      : super.only(bottom: WidgetSizes.spacingXl);
}
