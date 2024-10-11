import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

final class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.imageUrl,
    required this.movieTitle,
    super.key,
  });
  final String imageUrl;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: ClipRRect(
        borderRadius: const BorderRadiusGeneral.all(),
        child: Stack(
          alignment: Alignment.bottomLeft,
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
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const PagePadding.all(),
              child:
                  Text(movieTitle, style: ProductStyles.instance.onboardTitle),
            ),
          ],
        ),
      ),
    );
  }
}
