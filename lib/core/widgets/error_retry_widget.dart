import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';

class ErrorRetryWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final Widget? icon;

  const ErrorRetryWidget({required this.message, required this.onRetry, super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.padding24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Icon(Icons.error_outline_rounded, size: 64.sp, color: Colors.grey),
            SizedBox(height: AppDimensions.padding16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.padding24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, size: AppDimensions.iconSizeSmall),
              label: const Text(AppStrings.retry),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radius8)),
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding24, vertical: AppDimensions.padding12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
