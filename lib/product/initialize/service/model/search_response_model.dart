import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:vexana/vexana.dart';

part 'search_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class SearchResponse extends INetworkModel<SearchResponse>
    with EquatableMixin {
  SearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  @override
  SearchResponse fromJson(Map<String, dynamic> json) =>
      SearchResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SearchResponseToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  SearchResponse copyWith({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return SearchResponse(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
