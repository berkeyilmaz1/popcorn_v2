import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/log_in/view/log_in_view.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/mixin/sign_up_view_mixin.dart';
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

class _SignUpViewState extends State<SignUpView> with SignUpViewMixin {
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
          SignUpComponents(
            buttonOnPressed: () {
              signUpAndVerify(emailController.text, passwordController.text);
            },
            emailController: emailController,
            passwordController: passwordController,
          ),
        ],
      ),
    );
  }
}
