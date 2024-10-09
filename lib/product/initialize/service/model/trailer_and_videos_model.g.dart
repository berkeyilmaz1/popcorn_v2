// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_and_videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerAndVideos _$TrailerAndVideosFromJson(Map<String, dynamic> json) =>
    TrailerAndVideos(
      id: (json['id'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrailerAndVideosToJson(TrailerAndVideos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
