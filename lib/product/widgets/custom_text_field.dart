import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

/// CustomTextField is a custom text field widget that can be used to create text fields with a label and hint text.
final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.keyboardType,
    required this.labelText,
    this.obscureText = false,
    super.key,
    this.validator,
    this.controller,
    this.onChanged,
  });
  final TextInputType? keyboardType;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: onChanged,
            controller: controller,
            cursorColor: ProductColors.purple,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelStyle: const TextStyle(
                color: ProductColors.white,
              ),
              labelText: labelText.tr(),
              labelStyle: const TextStyle(
                color: ProductColors.white,
              ),
              fillColor: Colors.grey.withOpacity(0.5),
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadiusGeneral.allLow(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
