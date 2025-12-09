import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/theme/presentation/cubit/theme_cubit.dart';
import '../enums/usecase_status.dart';
import '../networking/interface/error_response.dart';
import '../theme/styles/text_styles.dart';

class HorizontalListView<B extends StateStreamableSource<S>, S, T> extends StatelessWidget {
  const HorizontalListView({super.key, required this.dataSelector, required this.sectionTitle, required this.itemBuilder});

  final String sectionTitle;
  final ({UsecaseStatus status, ErrorResponse? error, List<T> items}) Function(S) dataSelector;
  final Widget Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<ThemeCubit>().state.palette;
    final styles = TextStyles(palette);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Text(sectionTitle, style: styles.heading1Style),
        ),
        BlocSelector<B, S, ({UsecaseStatus status, ErrorResponse? error, List<T> items})>(
          selector: dataSelector,
          builder: (context, data) {
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 300.h, // Image height + title height + paddings
                child: switch (data.status) {
                  UsecaseStatus.initial => const Center(child: CircularProgressIndicator.adaptive()),
                  UsecaseStatus.loading => const Center(child: CircularProgressIndicator.adaptive()),
                  UsecaseStatus.failure => Center(child: Text('Error: ${data.error?.message ?? "Unknown error"}')),
                  UsecaseStatus.success => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    itemCount: data.items.length,
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) => itemBuilder(data.items[index]),
                  ),
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
