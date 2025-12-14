import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../enums/usecase_status.dart';
import '../networking/interface/error_response.dart';

class CustomGridView<B extends StateStreamableSource<S>, S, T> extends StatelessWidget {
  const CustomGridView({super.key, required this.dataSelector, required this.itemBuilder, required this.skeleton});

  final ({UsecaseStatus status, ErrorResponse? error, List<T> items}) Function(S) dataSelector;
  final Widget Function(T item) itemBuilder;
  final Widget skeleton;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, ({UsecaseStatus status, ErrorResponse? error, List<T> items})>(
      selector: dataSelector,
      builder: (context, data) {
        return _buildStatusView(
          data.status,
          successView: GridView.builder(
            key: const Key('customGridView'),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 173 / 230,
            ),
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              if (data.status != UsecaseStatus.success) return skeleton;
              final item = data.items[index];
              return itemBuilder(item);
            },
          ),
          failureView: Center(child: Text('Error: ${data.error?.message ?? "Unknown error"}')),
        );
      },
    );
  }

  Widget _buildStatusView(UsecaseStatus status, {required Widget successView, required Widget failureView}) {
    switch (status) {
      case UsecaseStatus.initial:
      case UsecaseStatus.loading:
      case UsecaseStatus.success:
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: Skeletonizer(enabled: status != UsecaseStatus.success, child: successView),
        );
      case UsecaseStatus.failure:
        return FadeIn(duration: const Duration(milliseconds: 500), child: failureView);
    }
  }
}
