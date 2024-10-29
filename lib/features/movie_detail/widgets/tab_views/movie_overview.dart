part of '../movie_info_tab.dart';
final class MovieOverview extends StatelessWidget {
  const MovieOverview({required this.movie, super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.overview ?? '',
            style: ProductStyles.instance.onboardDescription,
          ),
        ],
      ),
    );
  }
}
