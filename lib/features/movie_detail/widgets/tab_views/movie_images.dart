part of '../movie_info_tab.dart';

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
