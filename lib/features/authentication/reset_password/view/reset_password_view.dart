import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/reset_password/view/mixin/reset_password_mixin.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/black_purple_gradient.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/custom_text_field.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

@RoutePage()
final class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView>
    with ResetPasswordMixin {
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
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BlackPurpleGradient(),
          Padding(
            padding: const PagePadding.all(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.auth_resetPassword,
                  style: ProductStyles.instance.onboardTitle,
                ).tr(),
                CustomTextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  labelText: LocaleKeys.auth_email,
                ),
                CustomElevatedButton(
                  buttonText: LocaleKeys.auth_resetPassword,
                  backgroundColor: ProductColors.purple,
                  onPressed: () => resetButtonPressed(emailController.text),
                  buttonTextStyle: ProductStyles.instance.authButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
