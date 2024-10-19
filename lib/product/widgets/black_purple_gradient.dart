import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';

final class BlackPurpleGradient extends StatelessWidget {
  const BlackPurpleGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ProductColors.black.withOpacity(0.4),
            ProductColors.purple.withOpacity(0.4),
          ],
        ),
      ),
    );
  }
}
