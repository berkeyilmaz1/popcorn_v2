import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/log_in/view/mixin/log_in_view_mixin.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/black_purple_gradient.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/custom_text_field.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/log_in_components.dart';

final class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> with LogInViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: WidgetSizes.spacingZero,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ProductColors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BlackPurpleGradient(),
          LogInComponents(
            buttonOnPressed: () {
              logIn(emailController.text, passwordController.text);
            },
            emailController: emailController,
            passwordController: passwordController,
          ),
        ],
      ),
    );
  }
}
