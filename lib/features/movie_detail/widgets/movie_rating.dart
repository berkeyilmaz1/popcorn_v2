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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: movie.voteAverage!.toStringAsFixed(1),
                        style: ProductStyles.instance.authButton,
                      ),
                      TextSpan(
                        text: '/${movie.voteCount}', // İkinci text (voteCount)
                        style: ProductStyles
                            .instance.voteCount, // İkinci text için stil
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
