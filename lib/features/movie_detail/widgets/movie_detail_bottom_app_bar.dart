part of '../view/movie_detail_view.dart';

final class MovieDetailBottomAppBar extends StatelessWidget {
  const MovieDetailBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ProductColors.backgroundColor.withOpacity(0.5),
      elevation: WidgetSizes.spacingZero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ProductColors.purple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusGeneral.allLow(),
          ),
        ),
        onPressed: () {},
        child: Text(
          LocaleKeys.detail_buyTicket,
          style: ProductStyles.instance.authButton,
        ).tr(),
      ),
    );
  }
}
