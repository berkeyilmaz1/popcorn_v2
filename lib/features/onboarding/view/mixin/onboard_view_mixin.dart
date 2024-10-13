import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/onboard_manager/onboard_manager.dart';
import 'package:popcorn_v2/features/onboarding/view/onboard_view.dart';
import 'package:popcorn_v2/features/onboarding/pages/onboard_pages.dart';

/// Mixin for [OnboardView] to separate the logic from the view.
mixin OnboardViewMixin on State<OnboardView> {
  @override
  void initState() {
    super.initState();
    _onboardManager = OnboardManager();
  }

  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  ValueNotifier<int> get currentPage => _currentPage;

  /// PageController for the onboarding pages.
  final PageController _onboardingController = PageController();

  /// List of onboarding pages.
  final List<Widget> _onboardingPages = const [
    OnboardDiscover(),
    OnboardFollow(),
    OnboardCast(),
    OnboardSuggestion(),
  ];

  /// Getters for the onboarding controller and pages.
  PageController get onboardingController => _onboardingController;
  List<Widget> get onboardingPages => _onboardingPages;

  late final OnboardManager _onboardManager;

  void completeOnboarding() {
    _onboardManager.completeOnboarding();
  }

  /// Method to animate to the next page.
  void animateToNextPage() {
    _onboardingController.nextPage(
      ///todo const
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  /// Method to animate to the last page.
  void animateToLastPage() {
    _onboardingController.jumpToPage(
      _onboardingPages.length - 1,
    );
  }
}
