// Flutter imports
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:examplearch/core/res/images.dart';

class ImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final ImageWidgetBuilder imageBuilder;
  final AssetImage? placeholder;
  const ImageNetwork(
      {Key? key, this.imageUrl, required this.imageBuilder, this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? imageBuilder.call(context, placeholder ?? AppImages.facebook)
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: imageBuilder,
            fadeOutDuration: Duration.zero,
            fadeInDuration: Duration.zero,
            placeholder: (context, url) =>
                imageBuilder.call(context, placeholder ?? AppImages.facebook),
            errorWidget: (context, url, error) =>
                imageBuilder.call(context, placeholder ?? AppImages.facebook),
          );
  }
}
