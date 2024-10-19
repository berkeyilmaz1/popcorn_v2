// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteRequest _$FavoriteRequestFromJson(Map<String, dynamic> json) =>
    FavoriteRequest(
      mediaType: json['mediaType'] as String?,
      mediaId: (json['mediaId'] as num?)?.toInt(),
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$FavoriteRequestToJson(FavoriteRequest instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'mediaId': instance.mediaId,
      'favorite': instance.favorite,
    };
