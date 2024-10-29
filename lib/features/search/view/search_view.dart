import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/search/cubit/search_cubit.dart';
import 'package:popcorn_v2/features/search/cubit/search_state.dart';
import 'package:popcorn_v2/features/search/view/mixin/search_view_mixin.dart';
import 'package:popcorn_v2/features/search/widget/search_field.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/movie_rating.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widget/movie_info.dart';

final class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with BaseState, SearchViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            LocaleKeys.search_search,
            style: ProductStyles.instance.onboardTitle,
          ).tr(),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchField(
                  controller: searchController,
                  onChanged: searchMovies,
                  onClear: searchController.clear,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.searchedMovies?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      if (state.searchedMovies == null) {
                        return const CircularProgressIndicator();
                      }
                      return MovieInfo(
                        onTap: () => navigateToDetail(
                          context,
                          state.searchedMovies![index],
                        ),
                        imageUrl: state.searchedMovies?[index].posterPath,
                        movie: state.searchedMovies![index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
