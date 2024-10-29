part of 'movie_info_tab.dart';

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

class MovieCast extends StatelessWidget {
  const MovieCast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final class MovieImages extends StatelessWidget {
  const MovieImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final images = state.movieImages;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const PagePadding.all(),
              child: MovieCard(
                imageUrl: ServicePaths.posterPath(
                  images?[index].filePath ?? '',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
