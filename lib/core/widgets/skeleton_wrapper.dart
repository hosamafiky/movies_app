import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../extensions/context.dart';

class SkeletonWrapper extends StatelessWidget {
  const SkeletonWrapper({super.key, required this.child, required this.enabled});

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      effect: PulseEffect(from: context.watchPalette.shimmerBase, to: context.watchPalette.shimmerHighlight),
      child: child,
    );
  }
}
