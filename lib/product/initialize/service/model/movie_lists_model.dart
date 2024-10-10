import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:vexana/vexana.dart';

part 'movie_lists_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class MovieLists extends INetworkModel<MovieLists> with EquatableMixin {
  MovieLists({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieLists.fromJson(Map<String, dynamic> json) =>
      _$MovieListsFromJson(json);
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  @override
  MovieLists fromJson(Map<String, dynamic> json) => MovieLists.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieListsToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  MovieLists copyWith({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return MovieLists(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
