import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/search/cubit/search_cubit.dart';
import 'package:popcorn_v2/features/search/view/search_view.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

mixin SearchViewMixin on State<SearchView>, BaseState<SearchView> {
  late final SearchCubit _searchCubit;
  SearchCubit get searchCubit => _searchCubit;

  late final TextEditingController _searchController;
  TextEditingController get searchController => _searchController;

  @override
  void initState() {
    super.initState();
    final movieService = MovieService(networkManager: networkManager);
    _searchCubit = SearchCubit(movieService: movieService);

    _searchController = TextEditingController();
  }

  Future<void> searchMovies(String query) async {
    await _searchCubit.searchMovies(query);
  }

  @override
  void dispose() {
    super.dispose();
    _searchCubit.close();
  }
}
