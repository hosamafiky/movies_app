import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:cinemahub/core/widgets/skeleton_wrapper.dart';
import 'package:cinemahub/features/movies/domain/entities/trailer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../../core/extensions/duration.dart';

class TrailerWidget extends StatefulWidget {
  const TrailerWidget(this.trailer, {super.key}) : _isSkeleton = false;

  TrailerWidget.skeleton({super.key}) : trailer = Trailer.empty(), _isSkeleton = true;

  final Trailer trailer;
  final bool _isSkeleton;

  @override
  State<TrailerWidget> createState() => _TrailerWidgetState();
}

class _TrailerWidgetState extends State<TrailerWidget> with AutomaticKeepAliveClientMixin {
  final yt = YoutubeExplode();
  ValueNotifier<Duration> videoDuration = ValueNotifier(Duration.zero);
  @override
  void initState() {
    super.initState();
    _loadTrailerData();
  }

  @override
  void didUpdateWidget(TrailerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If widget was skeleton and now has real data, load trailer info
    if (oldWidget._isSkeleton && !widget._isSkeleton) {
      _loadTrailerData();
    }
  }

  Future<void> _loadTrailerData() async {
    // Skip if skeleton mode
    if (widget._isSkeleton) return;

    // Fetch video details
    final video = await yt.videos.get(widget.trailer.key);
    videoDuration.value = video.duration ?? Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final styles = context.watchTextStyles;
    return ValueListenableBuilder(
      valueListenable: videoDuration,
      builder: (context, duration, child) {
        return SkeletonWrapper(
          enabled: widget._isSkeleton,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 160.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: AppCachedNetworkImage(
                    isSkeleton: widget._isSkeleton,
                    imageUrl: 'https://img.youtube.com/vi/${widget.trailer.key}/0.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(widget.trailer.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
                Text((duration).format, style: styles.body1Style),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
