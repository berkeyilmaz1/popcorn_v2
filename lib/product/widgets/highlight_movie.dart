import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

final class HighlightMovie extends StatelessWidget {
  const HighlightMovie({
    required this.imageUrl,
    required this.onTap,
    this.movieTitle,
    super.key,
  });
  final String imageUrl;
  final String? movieTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: ClipRRect(
        borderRadius: const BorderRadiusGeneral.all(),
        child: Stack(
          alignment: Alignment.bottomCenter,
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
                  stops: [0.0, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: GestureDetector(
                onTap: onTap,
                child: CachedNetworkImage(
                  imageUrl: ServicePaths.posterPath(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const PagePadding.all(),
              child: Text(
                movieTitle ?? '',
                style: ProductStyles.instance.onboardTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
