import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: WidgetSizes.spacingXxl1,
              color: ProductColors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
