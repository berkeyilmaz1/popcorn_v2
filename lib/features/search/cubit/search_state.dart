import 'package:equatable/equatable.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';

final class SearchState extends Equatable {
  const SearchState({this.isLoading = false, this.searchedMovies});

  final bool isLoading;
  final List<Movie>? searchedMovies;

  @override
  List<Object?> get props => [searchedMovies];

  SearchState copyWith({List<Movie>? searchedMovies, bool? isLoading}) {
    return SearchState(
      searchedMovies: searchedMovies ?? this.searchedMovies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
