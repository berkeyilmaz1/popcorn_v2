part of '../view/movie_detail_view.dart';

final class MovieBackground extends StatelessWidget {
  const MovieBackground({required this.movie, super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ProductColors.black,
            Colors.transparent,
          ],
          stops: [WidgetSizes.spacingZero, WidgetSizes.spacingXxxSmall],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final images = state.movieImages?.first;
          return Stack(
            children: [
              CachedNetworkImage(
                imageUrl: ServicePaths.posterPath(
                  images?.filePath ?? '',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
