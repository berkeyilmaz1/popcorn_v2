import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/verification_view.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/black_purple_gradient.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/custom_text_field.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/sign_up_components.dart';

final class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BlackPurpleGradient(),
         
          SignUpComponents(),
        ],
      ),
    );
  }
}
