
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cure_team_2/core/extensions/style.dart';
import 'package:flutter/material.dart';



class AppCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Alignment? alignment ;

  const AppCachedNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
        this.alignment,
    this.borderRadius,
    this.color,
    this.colorBlendMode,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl== null || imageUrl!.isEmpty  ) {
      return _buildErrorWidget();
    }
    final image = CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment ?? Alignment.center,
      memCacheWidth: 600,
      placeholder: (context, url) => placeholder ?? _buildPlaceholder(context),
      errorWidget: (context, url, error) => errorWidget ?? _buildErrorWidget(),
    );
    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }

  Widget _buildPlaceholder(BuildContext context) {

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: borderRadius,
      ),
      child: const CircularProgressIndicator()
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image, color: Colors.grey, size: 32),
    );
  }
}
