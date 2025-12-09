import 'package:cinemahub/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/assets.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../theme/presentation/cubit/theme_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<ThemeCubit>().state.palette;
    return BlocSelector<LayoutCubit, LayoutState, int>(
      selector: (state) => state.currentIndex,
      builder: (context, index) {
        return BottomNavigationBar(
          currentIndex: index,
          onTap: context.read<LayoutCubit>().changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: Assets.assetsIconsSvgHome.svg(color: palette.bottomNavigationUnselected),
              activeIcon: Assets.assetsIconsSvgHomeFilled.svg(color: palette.bottomNavigationSelected),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Assets.assetsIconsSvgMovies.svg(color: palette.bottomNavigationUnselected),
              activeIcon: Assets.assetsIconsSvgMoviesFilled.svg(color: palette.bottomNavigationSelected),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Assets.assetsIconsSvgTvShows.svg(color: palette.bottomNavigationUnselected),
              activeIcon: Assets.assetsIconsSvgTvshowsFilled.svg(color: palette.bottomNavigationSelected),
              label: 'TV Shows',
            ),
            BottomNavigationBarItem(
              icon: Assets.assetsIconsSvgSearch.svg(color: palette.bottomNavigationUnselected),
              activeIcon: Assets.assetsIconsSvgSearchFilled.svg(color: palette.bottomNavigationSelected),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Assets.assetsIconsSvgWatchlist.svg(color: palette.bottomNavigationUnselected),
              activeIcon: Assets.assetsIconsSvgWatchlistFilled.svg(color: palette.bottomNavigationSelected),
              label: 'Watchlist',
            ),
          ],
        );
      },
    );
  }
}
