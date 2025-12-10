import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemahub/core/extensions/context.dart';
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
          CachedNetworkImage(
            imageUrl: actor.fullProfilePath,
            imageBuilder: (context, imageProvider) => CircleAvatar(radius: 64.r, backgroundImage: imageProvider),
            progressIndicatorBuilder: (context, url, downloadProgress) => CircleAvatar(
              radius: 64.r,
              backgroundColor: Colors.grey.shade200,
              child: CircularProgressIndicator.adaptive(value: downloadProgress.progress),
            ),
          ),
          SizedBox(height: 16.h),
          Text(actor.name, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: styles.title1Style),
          Text(actor.character, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: styles.body1Style),
        ],
      ),
    );
  }
}
