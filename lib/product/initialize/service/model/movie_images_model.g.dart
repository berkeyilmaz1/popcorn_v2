// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieImagesList _$MovieImagesListFromJson(Map<String, dynamic> json) =>
    MovieImagesList(
      backdrops: (json['backdrops'] as List<dynamic>?)
          ?.map((e) => MovieImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieImagesListToJson(MovieImagesList instance) =>
    <String, dynamic>{
      'backdrops': instance.backdrops,
    };

MovieImages _$MovieImagesFromJson(Map<String, dynamic> json) => MovieImages(
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toInt(),
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieImagesToJson(MovieImages instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
