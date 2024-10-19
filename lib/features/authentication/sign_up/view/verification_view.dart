import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/mixin/verification_view_mixin.dart';
import 'package:popcorn_v2/features/home/tab/tab_view.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/black_purple_gradient.dart';

part '../widgets/verification_components.dart';

final class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView>
    with VerificationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BlackPurpleGradient(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.auth_verification,
                style: ProductStyles.instance.appTitle,
              ).tr(),
              ElevatedButton(
                onPressed: () async {
                  final isUserVerified = await checkUserVerified();
                  if (isUserVerified == true) {
                    await Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<TabView>(
                        builder: (context) => const TabView(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const Text('go'),
              ),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    text: LocaleKeys.auth_didntreceive.tr(),
                    style: ProductStyles.instance.haveAnAcc,
                    children: <TextSpan>[
                      TextSpan(
                        text: LocaleKeys.auth_resendCode.tr(),
                        style: ProductStyles.instance.haveAnAcc.copyWith(
                          color: ProductColors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
