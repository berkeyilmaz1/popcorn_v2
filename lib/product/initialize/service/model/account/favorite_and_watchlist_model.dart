import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:vexana/vexana.dart';

part 'favorite_and_watchlist_model.g.dart';

///this model is used for get all favorites and watchlist movies
@JsonSerializable(fieldRename: FieldRename.snake)
final class FavoriteAndWatchlist extends INetworkModel<FavoriteAndWatchlist>
    with EquatableMixin {
  FavoriteAndWatchlist({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory FavoriteAndWatchlist.fromJson(Map<String, dynamic> json) =>
      _$FavoriteAndWatchlistFromJson(json);
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  @override
  FavoriteAndWatchlist fromJson(Map<String, dynamic> json) =>
      FavoriteAndWatchlist.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FavoriteAndWatchlistToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  FavoriteAndWatchlist copyWith({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return FavoriteAndWatchlist(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
