part of '../view/home_view.dart';

final class MovieAndTitle extends StatelessWidget {
  const MovieAndTitle({
    required this.itemCount,
    required this.itemBuilder,
      this.title,
    super.key,
  });
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.vertical18Symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const PagePadding.horizontal16Symmetric(),
            child: Text(
              title ?? '',
              style: const TextStyle(color: Colors.white),
            ).tr(),
          ),
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
