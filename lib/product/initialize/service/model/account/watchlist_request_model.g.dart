// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchlistRequest _$WatchlistRequestFromJson(Map<String, dynamic> json) =>
    WatchlistRequest(
      mediaType: json['media_type'] as String?,
      mediaId: (json['media_id'] as num?)?.toInt(),
      watchlist: json['watchlist'] as bool?,
    );

Map<String, dynamic> _$WatchlistRequestToJson(WatchlistRequest instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'watchlist': instance.watchlist,
    };
