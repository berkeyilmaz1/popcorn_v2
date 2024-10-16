part of '../view/movie_detail_view.dart';

final class MoviePosterAndRating extends StatelessWidget {
  const MoviePosterAndRating({
    required this.widget,
    super.key,
  });

  final MovieDetailView widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -(WidgetSizes.spacingXxl12 + WidgetSizes.spacingL),
      left: WidgetSizes.spacingZero,
      right: WidgetSizes.spacingZero,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: MovieCard(
              imageUrl: widget.movie.posterPath ?? '',
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const PagePadding.horizontal16Symmetric(),
              child: MovieRating(movie: widget.movie),
            ),
          ),
        ],
      ),
    );
  }
}
