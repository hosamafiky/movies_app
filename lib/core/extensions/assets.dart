import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension AssetExt on String {
  Widget svg({double? width, double? height, Color? color, AlignmentGeometry alignment = Alignment.center, BoxFit fit = BoxFit.contain}) {
    return RepaintBoundary(
      child: SvgPicture.asset(
        split('/').length == 1 ? 'assets/icons/svg/$this' : this,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      ),
    );
  }

  Widget image({double? width, double? height, Color? color, AlignmentGeometry alignment = Alignment.center, BoxFit fit = BoxFit.contain}) {
    assert(endsWith('.png') || endsWith('.jpg') || endsWith('.jpeg'), 'AssetExt: $this is not an image file');
    return Image.asset(this, width: width, height: height, fit: fit, alignment: alignment, color: color);
  }

  ImageProvider get imageProvider {
    assert(endsWith('.png') || endsWith('.jpg') || endsWith('.jpeg'), 'AssetExt: $this is not an image file');
    return AssetImage(this);
  }
}
