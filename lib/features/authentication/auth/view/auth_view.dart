import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/log_in/view/log_in_view.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/sign_up_view.dart';
import 'package:popcorn_v2/features/home/tab/tab_view.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/or_divider.dart';

final class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
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
          Column(
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<TabView>(
                      builder: (context) => const LogInView(),
                    ),
                  );
                },
                buttonTextStyle: ProductStyles.instance.authButton,
              ),
              const OrDivider(),
              CustomElevatedButton(
                backgroundColor: ProductColors.purple,
                buttonText: LocaleKeys.auth_signUp,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<TabView>(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                buttonTextStyle: ProductStyles.instance.authButton,
              ),
              const SizedBox(height: WidgetSizes.spacingL),
            ],
          ),
        ],
      ),
    );
  }
}
