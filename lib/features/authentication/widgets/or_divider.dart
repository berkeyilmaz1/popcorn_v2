part of '../auth_view.dart';
final class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.horizontalHighSymmetric(),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              LocaleKeys.auth_or,
              style: ProductStyles.instance.orDivider,
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
