import 'package:equatable/equatable.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';

final class FavoriteState extends Equatable {
  const FavoriteState({
    this.isLoading = false,
    this.favoriteMovies,
  });

  final bool isLoading;
  final List<Movie>? favoriteMovies;

  @override
  List<Object?> get props => [
        isLoading,
        favoriteMovies,
      ];

  FavoriteState copyWith({
    bool? isLoading,
    List<Movie>? favoriteMovies,
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      favoriteMovies: favoriteMovies ?? favoriteMovies,
    );
  }
}
