import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:cinemahub/features/movies/domain/entities/trailer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../../core/extensions/duration.dart';

class TrailerWidget extends StatefulWidget {
  const TrailerWidget(this.trailer, {super.key});

  final Trailer trailer;

  @override
  State<TrailerWidget> createState() => _TrailerWidgetState();
}

class _TrailerWidgetState extends State<TrailerWidget> with AutomaticKeepAliveClientMixin {
  final yt = YoutubeExplode();
  ValueNotifier<Duration?> videoDuration = ValueNotifier(null);
  @override
  void initState() {
    super.initState();
    _loadTrailerData();
  }

  void _loadTrailerData() async {
    final video = await yt.videos.get(widget.trailer.key);
    videoDuration.value = video.duration;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final styles = context.watchTextStyles;
    return ValueListenableBuilder(
      valueListenable: videoDuration,
      builder: (context, duration, child) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 160.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: AppCachedNetworkImage(imageUrl: 'https://img.youtube.com/vi/${widget.trailer.key}/0.jpg', fit: BoxFit.cover),
              ),
              SizedBox(height: 16.h),
              Text(widget.trailer.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
              Text((duration ?? Duration.zero).format, style: styles.body1Style),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
