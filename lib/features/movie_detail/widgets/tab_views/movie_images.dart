part of '../movie_info_tab.dart';

final class MovieImages extends StatelessWidget {
  const MovieImages({super.key});

  void showZoomableImage(BuildContext context, String imageUrl) {
    showDialog<Dialog>(
      context: context,
      builder: (context) {
        return Dialog(
          child: InteractiveViewer(
            child: Image.network(
              imageUrl,
            ),
          ),
        );
      },
    );
  }

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
                onTap: () => showZoomableImage(
                  context,
                  ServicePaths.posterPath(
                    images?[index].filePath ?? '',
                  ),
                ),
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
