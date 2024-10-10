import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/onboarding/onboard/mixin/onboard_view_mixin.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
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
            // onPageChanged: (int index) => currentPage.value = index,
            controller: onboardingController,
            children: onboardingPages,
          ),
          SmoothPageIndicator(
            controller: onboardingController,
            count: onboardingPages.length,
            effect: WormEffect(
              activeDotColor: ProductColors.purple2,
              dotColor: ProductColors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
