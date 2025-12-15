import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enums/usecase_status.dart';
import '../networking/interface/error_response.dart';

class CustomGridView<B extends StateStreamableSource<S>, S, T> extends StatelessWidget {
  const CustomGridView({super.key, required this.dataSelector, required this.itemBuilder, required this.skeleton, this.skeletonItemCount = 6});

  final ({UsecaseStatus status, ErrorResponse? error, List<T> items}) Function(S) dataSelector;
  final Widget Function(T item) itemBuilder;
  final Widget skeleton;
  final int skeletonItemCount;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, ({UsecaseStatus status, ErrorResponse? error, List<T> items})>(
      selector: dataSelector,
      builder: (context, data) {
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: switch (data.status) {
            UsecaseStatus.failure => Center(child: Text('Error: ${data.error?.message ?? "Unknown error"}')),
            _ => GridView.builder(
              key: const Key('customGridView'),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 173 / 230,
              ),
              itemCount: data.status != UsecaseStatus.success ? skeletonItemCount : data.items.length,
              itemBuilder: (context, index) {
                if (data.status != UsecaseStatus.success) return skeleton;
                final item = data.items[index];
                return itemBuilder(item);
              },
            ),
          },
        );
      },
    );
  }
}
