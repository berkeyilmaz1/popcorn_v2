// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastList _$CastListFromJson(Map<String, dynamic> json) => CastList(
      id: (json['id'] as num?)?.toInt(),
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastListToJson(CastList instance) => <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
