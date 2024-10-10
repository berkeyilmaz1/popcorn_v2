import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/utils/constants/asset_constants.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

final class OnboardDiscover extends StatefulWidget {
  const OnboardDiscover({super.key});

  @override
  State<OnboardDiscover> createState() => _OnboardDiscoverState();
}

class _OnboardDiscoverState extends State<OnboardDiscover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetConstants.onboardDiscover,
                width: WidgetSizes.spacingXxlL13,
                height: WidgetSizes.spacingXxlL13,
              ),
              Padding(
                padding: const PagePadding.vertical18Symmetric(),
                child: Text(
                  LocaleKeys.onboarding_page1_title,
                  textAlign: TextAlign.center,
                  style: ProductStyles.instance.onboardTitle,
                ).tr(),
              ),
              Text(
                LocaleKeys.onboarding_page1_description,
                style: ProductStyles.instance.onboardDescription,
                textAlign: TextAlign.center,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}

final class OnboardFollow extends StatefulWidget {
  const OnboardFollow({super.key});

  @override
  State<OnboardFollow> createState() => _OnboardFollowState();
}

class _OnboardFollowState extends State<OnboardFollow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetConstants.onboardFollow,
                width: WidgetSizes.spacingXxlL13,
                height: WidgetSizes.spacingXxlL13,
              ),
              Padding(
                padding: const PagePadding.vertical18Symmetric(),
                child: Text(
                  LocaleKeys.onboarding_page2_title,
                  textAlign: TextAlign.center,
                  style: ProductStyles.instance.onboardTitle,
                ).tr(),
              ),
              Text(
                LocaleKeys.onboarding_page2_description,
                style: ProductStyles.instance.onboardDescription,
                textAlign: TextAlign.center,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}

final class OnboardCast extends StatefulWidget {
  const OnboardCast({super.key});

  @override
  State<OnboardCast> createState() => _OnboardCastState();
}

class _OnboardCastState extends State<OnboardCast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetConstants.onboardCast,
                width: WidgetSizes.spacingXxlL13,
                height: WidgetSizes.spacingXxlL13,
              ),
              Padding(
                padding: const PagePadding.vertical18Symmetric(),
                child: Text(
                  LocaleKeys.onboarding_page3_title,
                  textAlign: TextAlign.center,
                  style: ProductStyles.instance.onboardTitle,
                ).tr(),
              ),
              Text(
                LocaleKeys.onboarding_page3_description,
                style: ProductStyles.instance.onboardDescription,
                textAlign: TextAlign.center,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}

final class OnboardSuggestion extends StatefulWidget {
  const OnboardSuggestion({super.key});

  @override
  State<OnboardSuggestion> createState() => _OnboardSuggestionState();
}

class _OnboardSuggestionState extends State<OnboardSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const PagePadding.all(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetConstants.onboardSuggestion,
                width: WidgetSizes.spacingXxlL13,
                height: WidgetSizes.spacingXxlL13,
              ),
              Padding(
                padding: const PagePadding.vertical18Symmetric(),
                child: Text(
                  LocaleKeys.onboarding_page4_title,
                  textAlign: TextAlign.center,
                  style: ProductStyles.instance.onboardTitle,
                ).tr(),
              ),
              Text(
                LocaleKeys.onboarding_page4_description,
                textAlign: TextAlign.center,
                style: ProductStyles.instance.onboardDescription,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
