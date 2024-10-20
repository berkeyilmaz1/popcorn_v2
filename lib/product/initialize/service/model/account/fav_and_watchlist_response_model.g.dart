// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_and_watchlist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavAndWatchlistResponse _$FavAndWatchlistResponseFromJson(
        Map<String, dynamic> json) =>
    FavAndWatchlistResponse(
      success: json['success'] as bool?,
      statusCode: (json['status_code'] as num?)?.toInt(),
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$FavAndWatchlistResponseToJson(
        FavAndWatchlistResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
