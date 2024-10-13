import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

final class MoviesWithTitle extends StatelessWidget {
  const MoviesWithTitle({
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });
  final String title;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ).tr(),
          SizedBox(
            height: WidgetSizes.spacingXxlL13,
            child: ListView.builder(
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: itemBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
