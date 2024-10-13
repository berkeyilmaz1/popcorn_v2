import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

final class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.imageUrl,
    required this.movieTitle,
    super.key,
  });
  final String? imageUrl;
  final String? movieTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allLow(),
      child: ClipRRect(
        borderRadius: const BorderRadiusGeneral.all(),
        child: CachedNetworkImage(
          imageUrl: ServicePaths.posterPath(imageUrl ?? ''),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
