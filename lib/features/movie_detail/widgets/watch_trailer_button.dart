part of '../view/movie_detail_view.dart';

final class WatchTrailerButton extends StatefulWidget {
  const WatchTrailerButton({
    required this.movie,
    super.key,
  });
  final Movie movie;

  @override
  State<WatchTrailerButton> createState() => _WatchTrailerButtonState();
}

class _WatchTrailerButtonState extends State<WatchTrailerButton>
    with BaseState<WatchTrailerButton>, WatchTrailerButtonMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: BottomAppBar(
        color: ProductColors.backgroundColor.withOpacity(0.5),
        elevation: WidgetSizes.spacingZero,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ProductColors.purple,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeneral.allLow(),
                ),
              ),
              onPressed: () async => fetchTrailer(),
              child: Text(
                LocaleKeys.detail_watchTrailer,
                style: ProductStyles.instance.authButton,
              ).tr(),
            );
          },
        ),
      ),
    );
  }
}

mixin WatchTrailerButtonMixin
    on State<WatchTrailerButton>, BaseState<WatchTrailerButton> {
  late MovieService movieService;

  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    movieService = MovieService(networkManager: networkManager);
    homeCubit = HomeCubit(movieService: movieService);
  }

  Future<void> fetchTrailer() async {
    final response =
        await movieService.getMovieVideos(widget.movie.id.toString());
    if (response == null && response?.first.key == null) return;

    await launchTrailer(response!.first.key!);
  }

  Future<void> launchTrailer(String movieKey) async {
    final url = Uri.parse(ProductConstants.youtubeUrl + movieKey);
    await launchUrl(url);
  }
}
