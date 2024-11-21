part of '../movie_info_tab.dart';

final class MovieCast extends StatelessWidget {
  const MovieCast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.movieCast?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final cast = state.movieCast?[index];
            return Card(
              color: ProductColors.backgroundColor.withOpacity(0.5),
              child: Column(
                children: [
                  Padding(
                    padding: const PagePadding.all(),
                    child: SizedBox(
                      width:
                          WidgetSizes.spacingHundred + WidgetSizes.spacingXxl1,
                      child: MovieCard(
                        imageUrl:
                            ServicePaths.posterPath(cast?.profilePath ?? ''),
                      ),
                    ),
                  ),
                  Text(
                    cast?.name ?? '',
                    style: ProductStyles.instance.onboardTitle.copyWith(
                      fontSize: WidgetSizes.spacingL,
                    ),
                  ),
                  Text(
                    cast?.character ?? '',
                    style: ProductStyles.instance.orDivider,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
