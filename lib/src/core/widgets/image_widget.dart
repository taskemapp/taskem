import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Widget to display an image from a url
class ImageWidget extends StatelessWidget {
  ///Constructor
  const ImageWidget({
    required this.url,
    super.key,
    this.fit,
    this.width,
    this.height,
    this.fadeInDuration,
    this.fadeOutDuration,
    this.alignment,
    this.color,
    this.colorBlendMode,
    this.errorWidget,
    this.httpHeaders,
  });

  ///Url of the image
  final String url;

  ///Fit of the image
  final BoxFit? fit;

  ///Width of the image
  final double? width;

  ///Height of the image
  final double? height;

  ///The duration of the fade-in animation for the [url]
  final Duration? fadeInDuration;

  ///The duration of the fade-out animation for the [url]
  final Duration? fadeOutDuration;

  ///Image alignment
  final Alignment? alignment;

  ///Color over image
  final Color? color;

  ///Color blend mode
  final BlendMode? colorBlendMode;

  final Widget Function(
    BuildContext context,
    String url,
    Object error,
  )? errorWidget;

  final Map<String, String>? httpHeaders;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: url,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      fadeInDuration: fadeInDuration ?? const Duration(milliseconds: 300),
      fadeOutDuration: fadeOutDuration,
      color: color,
      colorBlendMode: colorBlendMode,
      httpHeaders: httpHeaders,
      placeholderFadeInDuration: Duration.zero,
      errorWidget: errorWidget ??
          (context, url, error) => const Center(
                child: Icon(
                  Icons.error,
                ),
              ),
    );
  }
}
