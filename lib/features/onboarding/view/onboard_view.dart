import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:popcorn_v2/features/authentication/view/auth_view.dart';
import 'package:popcorn_v2/features/onboarding/view/mixin/onboard_view_mixin.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// View for the onboarding pages.
final class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> with OnboardViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: const Alignment(0, 0.9),
        children: [
          PageView(
            onPageChanged: (int index) => currentPage.value = index,
            controller: onboardingController,
            children: onboardingPages,
          ),
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: animateToLastPage,
                  child: Text(
                    LocaleKeys.onboarding_skip,
                    style: ProductStyles.instance.onboardSkip,
                  ).tr(),
                ).ext.toDisabled(
                      disable: currentPage.value == onboardingPages.length - 1,
                    ),
                SmoothPageIndicator(
                  controller: onboardingController,
                  count: onboardingPages.length,
                  effect: WormEffect(
                    activeDotColor: ProductColors.purple,
                    dotColor: ProductColors.black.withOpacity(0.5),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (onboardingController.page ==
                        onboardingPages.length - 1) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<AuthView>(
                          builder: (context) => const AuthView(),
                        ),
                        (route) => false,
                      );
                      completeOnboarding();
                    }
                    onboardingController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: ProductColors.purple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
