import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/auth_home/view/mixin/auth_view_mixin.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/router/app_router.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/or_divider.dart';

@RoutePage()
final class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with AuthViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          Padding(
            padding: const PagePadding.all(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  ProductConstants.appName,
                  style: ProductStyles.instance.appTitle,
                ),
                const Spacer(),
                CustomElevatedButton(
                  backgroundColor: ProductColors.purple,
                  buttonText: LocaleKeys.auth_logIn,
                  onPressed: () => pushToPages(const LogInRoute()),
                  buttonTextStyle: ProductStyles.instance.authButton,
                ),
                const OrDivider(),
                CustomElevatedButton(
                  backgroundColor: ProductColors.purple,
                  buttonText: LocaleKeys.auth_signUp,
                  onPressed: () => pushToPages(const SignUpRoute()),
                  buttonTextStyle: ProductStyles.instance.authButton,
                ),
                const SizedBox(height: WidgetSizes.spacingL),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
