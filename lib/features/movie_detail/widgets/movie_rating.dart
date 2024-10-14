part of '../view/movie_detail_view.dart';

final class MovieRating extends StatelessWidget {
  const MovieRating({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.originalTitle ?? '',
          style: ProductStyles.instance.onboardTitle,
        ),
        Text(
          movie.releaseDate ?? '',
          style: ProductStyles.instance.onboardDescription,
        ),
        const SizedBox(height: WidgetSizes.spacingXs),
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: Colors.yellow,
              size: WidgetSizes.spacingXxl1,
            ),
            Column(
              children: [
                Text(
                  movie.voteAverage!.toStringAsFixed(1),
                  style: ProductStyles.instance.authButton,
                ),
                Text(
                  movie.voteCount.toString(),
                  style: ProductStyles.instance.orDivider,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
