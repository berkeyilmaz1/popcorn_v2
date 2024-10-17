import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/black_purple_gradient.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/custom_text_field.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/verification_components.dart';

final class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BlackPurpleGradient(),
          VerificationComponents(),
        ],
      ),
    );
  }
}
