import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/mus.assets/export.dart';
import 'package:flutter_application_1/core/mus.assets/mus.asset.dart';

class MusAssetImage extends StatelessWidget {
  const MusAssetImage(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final MusAsset asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    switch (asset.type) {
      case MusAssetType.bitmap:
        return ExcludeSemantics(
          child: Image.asset(
            asset.path,
            width: width,
            height: height,
            color: color,
            fit: fit,
            alignment: alignment,
          ),
        );
      default:
        return Container();
    }
  }
}
