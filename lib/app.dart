import 'package:cinemahub/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/data/app_theme.dart';
import 'features/layout/presentation/pages/layout_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit(isDarkMode: true))],
      child: BlocSelector<ThemeCubit, ThemeState, ThemeMode>(
        selector: (state) => state.mode,
        builder: (context, mode) {
          return ScreenUtilInit(
            designSize: const Size(390, 971),
            minTextAdapt: true,
            ensureScreenSize: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: mode,
                home: LayoutPage(),
              );
            },
          );
        },
      ),
    );
  }
}
