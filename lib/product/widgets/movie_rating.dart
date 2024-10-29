import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

final class MovieRating extends StatelessWidget {
  const MovieRating({
    required this.movie,
    required this.showRating,
    super.key,
  });

  final Movie movie;
  final bool showRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title ?? '',
          style: ProductStyles.instance.onboardTitle,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          movie.releaseDate ?? '',
          style: ProductStyles.instance.onboardDescription,
        ),
        const SizedBox(height: WidgetSizes.spacingXs),
        if (movie.voteAverage != null && movie.voteCount != null && showRating)
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Colors.yellow,
                size: WidgetSizes.spacingXxl1,
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: movie.voteAverage?.toStringAsFixed(1),
                          style: ProductStyles.instance.authButton,
                        ),
                        TextSpan(
                          text:
                              '/${movie.voteCount}', // İkinci text (voteCount)

                          style: ProductStyles
                              .instance.voteCount, // İkinci text için stil
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
