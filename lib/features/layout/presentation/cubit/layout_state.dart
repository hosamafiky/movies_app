part of 'layout_cubit.dart';

class LayoutState extends Equatable {
  const LayoutState({this.currentIndex = 0});

  final int currentIndex;

  List<Widget> get pages => const [HomePage(), MainMoviesScreen(), TvShowsPage(), SearchPage(), WatchlistPage()];

  Widget get currentPage => pages[currentIndex];

  LayoutState copyWith({int? currentIndex}) {
    return LayoutState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
