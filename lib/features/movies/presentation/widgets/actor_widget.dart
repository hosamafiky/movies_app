import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:cinemahub/features/movies/domain/entities/actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActorWidget extends StatelessWidget {
  const ActorWidget(this.actor, {super.key});

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 130.w),
      child: Column(
        children: [
          AppCachedNetworkImage(imageUrl: actor.fullProfilePath, width: 128.r, height: 128.r, radius: 64.r, fit: BoxFit.cover),
          SizedBox(height: 16.h),
          Text(actor.name, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: styles.title1Style),
          Text(actor.character, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: styles.body1Style),
        ],
      ),
    );
  }
}
