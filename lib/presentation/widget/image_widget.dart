import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageType { svg, png }

abstract interface class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
}

class SvgImageWidget extends ImageWidget {
  const SvgImageWidget({
    super.key,
    required super.imagePath,
    super.width,
    super.height,
    super.fit,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

class PngImageWidget extends ImageWidget {
  const PngImageWidget({
    super.key,
    required super.imagePath,
    super.width,
    super.height,
    super.fit,
  });

  factory PngImageWidget.network({
    required String imagePath,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return _PngNetworkImageWidget(
      imagePath: imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) {
      return Container();
    }
    return Image.asset(imagePath, width: width, height: height, fit: fit);
  }
}

class _PngNetworkImageWidget extends PngImageWidget {
  const _PngNetworkImageWidget({
    required super.imagePath,
    super.width,
    super.height,
    super.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(imagePath, width: width, height: height, fit: fit);
  }
}
