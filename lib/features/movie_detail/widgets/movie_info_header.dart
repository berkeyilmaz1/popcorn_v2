part of '../view/movie_detail_view.dart';

final class MovieInfoHeader extends StatelessWidget {
  const MovieInfoHeader({required this.movie, super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ProductColors.black,
                Colors.transparent,
              ],
              stops: [WidgetSizes.spacingZero, WidgetSizes.spacingXSSs],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final images = state.movieImages?.first;
              return CachedNetworkImage(
                imageUrl: ServicePaths.posterPath(
                  images?.filePath ?? '',
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ProductColors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: ProductColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
