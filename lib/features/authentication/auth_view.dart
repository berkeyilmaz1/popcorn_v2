import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/asset_constants.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/custom_elevated_button.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

part 'widgets/or_divider.dart';

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
          Image.asset(
            AssetConstants.icPoster,
          ),
          //TODO
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ), // X ve Y yönünde bulanıklık derecesi
              child: Container(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ProductColors.black.withOpacity(0.4),
                  ProductColors.purple2.withOpacity(0.4),
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
                backgroundColor: ProductColors.purple2,
                buttonText: LocaleKeys.auth_logIn,
                onPressed: () {},
                buttonTextStyle: ProductStyles.instance.authButton,
              ),
              const OrDivider(),
              CustomElevatedButton(
                backgroundColor: ProductColors.purple2,
                buttonText: LocaleKeys.auth_signUp,
                onPressed: () {},
                buttonTextStyle: ProductStyles.instance.authButton,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
