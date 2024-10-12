import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_images_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class MovieImages extends INetworkModel<MovieImages> with EquatableMixin {
  MovieImages({
    this.backdrops,
  });

  factory MovieImages.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesFromJson(json);
  final List<Images>? backdrops;

  @override
  MovieImages fromJson(Map<String, dynamic> json) => MovieImages.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieImagesToJson(this);

  @override
  List<Object?> get props => [backdrops];

  MovieImages copyWith({
    List<Images>? backdrops,
  }) {
    return MovieImages(
      backdrops: backdrops ?? this.backdrops,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Images extends INetworkModel<Images> with EquatableMixin {
  Images({
    this.aspectRatio,
    this.height,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  final double? aspectRatio;
  final int? height;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  @override
  Images fromJson(Map<String, dynamic> json) => Images.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ImagesToJson(this);

  @override
  List<Object?> get props =>
      [aspectRatio, height, filePath, voteAverage, voteCount, width];

  Images copyWith({
    double? aspectRatio,
    int? height,
    void iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) {
    return Images(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
      filePath: filePath ?? this.filePath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      width: width ?? this.width,
    );
  }
}
