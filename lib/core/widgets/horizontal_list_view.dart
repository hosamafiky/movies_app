import 'package:animate_do/animate_do.dart';
import 'package:cinemahub/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/usecase_status.dart';
import '../networking/interface/error_response.dart';

class HorizontalListView<B extends StateStreamableSource<S>, S, T> extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.dataSelector,
    required this.sectionTitle,
    required this.itemBuilder,
    required this.skeleton,
    this.height,
    this.itemSpacing,
    this.skeletonItemCount = 5,
  });

  final String sectionTitle;
  final double? height, itemSpacing;
  final int skeletonItemCount;
  final ({UsecaseStatus status, ErrorResponse? error, List<T> items}) Function(S) dataSelector;
  final Widget Function(T item) itemBuilder;
  final Widget skeleton;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
    return BlocSelector<B, S, ({UsecaseStatus status, ErrorResponse? error, List<T> items})>(
      selector: dataSelector,
      builder: (context, data) {
        return Offstage(
          offstage: data.items.isEmpty && data.status == UsecaseStatus.success,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Text(sectionTitle, style: styles.heading1Style),
              ),
              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: height ?? 300.h,
                  child: switch (data.status) {
                    UsecaseStatus.failure => Center(child: Text('Error: ${data.error?.message ?? "Unknown error"}')),
                    _ => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      itemCount: data.status != UsecaseStatus.success ? skeletonItemCount : data.items.length,
                      separatorBuilder: (context, index) => SizedBox(width: itemSpacing ?? 12.w),
                      itemBuilder: (context, index) {
                        if (data.status != UsecaseStatus.success) return skeleton;
                        final item = data.items[index];
                        return itemBuilder(item);
                      },
                    ),
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
