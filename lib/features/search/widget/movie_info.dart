part of '../view/search_view.dart';

final class MovieInfo extends StatelessWidget {
  const MovieInfo({
    required this.onTap,
    required this.movie,
    super.key,
    this.imageUrl,
  });
  final VoidCallback onTap;
  final String? imageUrl;
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSizes.spacingXHundred,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: MovieCard(
                imageUrl: imageUrl,
              ),
            ),
            Expanded(
              flex: 2,
              child: MovieRating(
                movie: movie,
                showRating: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
