import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_images_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class MovieImagesList extends INetworkModel<MovieImagesList> with EquatableMixin {
  MovieImagesList({
    this.backdrops,
  });

  factory MovieImagesList.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesListFromJson(json);
  final List<MovieImages>? backdrops;

  @override
  MovieImagesList fromJson(Map<String, dynamic> json) => MovieImagesList.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieImagesListToJson(this);

  @override
  List<Object?> get props => [backdrops];

  MovieImagesList copyWith({
    List<MovieImages>? backdrops,
  }) {
    return MovieImagesList(
      backdrops: backdrops ?? this.backdrops,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieImages extends INetworkModel<MovieImages> with EquatableMixin {
  MovieImages({
    this.aspectRatio,
    this.height,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory MovieImages.fromJson(Map<String, dynamic> json) => _$MovieImagesFromJson(json);
  final double? aspectRatio;
  final int? height;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  @override
  MovieImages fromJson(Map<String, dynamic> json) => MovieImages.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieImagesToJson(this);

  @override
  List<Object?> get props =>
      [aspectRatio, height, filePath, voteAverage, voteCount, width];

  MovieImages copyWith({
    double? aspectRatio,
    int? height,
    void iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) {
    return MovieImages(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
      filePath: filePath ?? this.filePath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      width: width ?? this.width,
    );
  }
}
