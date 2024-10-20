// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteRequest _$FavoriteRequestFromJson(Map<String, dynamic> json) =>
    FavoriteRequest(
      mediaType: json['media_type'] as String?,
      mediaId: (json['media_id'] as num?)?.toInt(),
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$FavoriteRequestToJson(FavoriteRequest instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'favorite': instance.favorite,
    };
