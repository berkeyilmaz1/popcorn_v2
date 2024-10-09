// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_lists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieLists _$MovieListsFromJson(Map<String, dynamic> json) => MovieLists(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieListsToJson(MovieLists instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
