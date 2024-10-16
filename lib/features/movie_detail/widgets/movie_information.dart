part of '../view/movie_detail_view.dart';

class MovieInformation extends StatelessWidget {
  const MovieInformation({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: WidgetSizes.spacingXxl12 + WidgetSizes.spacingXsMid,
          ),
          const Text(
            LocaleKeys.detail_overview,
            style: TextStyle(
              color: ProductColors.white,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          Text(
            movie.overview ?? '',
            style: ProductStyles.instance.onboardDescription,
            maxLines: WidgetSizes.spacingXSs.truncate(),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: WidgetSizes.spacingXsMid,
          ),
          Text(
            LocaleKeys.detail_images,
            style: ProductStyles.instance.authButton,
          ).tr(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final images = state.movieImages;
              return SizedBox(
                height: WidgetSizes.spacingXxlL12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieCard(
                      imageUrl: ServicePaths.posterPath(
                        images?[index].filePath ?? '',
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
