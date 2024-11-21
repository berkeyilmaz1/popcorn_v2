part of '../view/favorites_view.dart';

final class DismissibleMovieCard extends StatelessWidget {
  const DismissibleMovieCard({
    required this.movie,
    required this.flexValue,
    required this.movieKey,
    required this.onTapped,
    super.key,
  });

  final Movie movie;
  final int flexValue;
  final String movieKey;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        movieKey,
      ),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: ProductColors.red,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: ProductColors.white,
        ),
      ),
      child: SizedBox(
        height: WidgetSizes.spacingXHundred,
        child: GestureDetector(
          onTap: onTapped,
          child: Row(
            children: [
              Expanded(
                child: MovieCard(imageUrl: movie.posterPath),
              ),
              Expanded(
                flex: flexValue,
                child: MovieRating(
                  movie: movie,
                  showRating: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
