import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

final class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonText,
    required this.backgroundColor,
    required this.onPressed,
    required this.buttonTextStyle,
    super.key,
  });
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle buttonTextStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const PagePadding.all(),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeneral.allLow(),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: buttonTextStyle,
              ).tr(),
            ),
          ),
        ),
      ],
    );
  }
}
