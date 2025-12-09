import 'package:cinemahub/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_navigation_bar.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocSelector<LayoutCubit, LayoutState, Widget>(
        selector: (state) => state.currentPage,
        builder: (context, page) {
          return Scaffold(body: page, bottomNavigationBar: BottomNavigationBarWidget());
        },
      ),
    );
  }
}
