import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:popcorn_v2/features/splash/mixin/splash_mixin.dart';
import 'package:popcorn_v2/product/utils/constants/asset_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(AssetConstants.popcornLoading),
      ),
    );
  }
}
