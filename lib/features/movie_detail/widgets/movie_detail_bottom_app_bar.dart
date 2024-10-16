part of '../view/movie_detail_view.dart';

final class MovieDetailBottomAppBarr extends StatelessWidget {
  const MovieDetailBottomAppBarr({
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
