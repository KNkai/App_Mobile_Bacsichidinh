import 'package:flutter/material.dart';

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    MaterialInkController? controller,
    RenderBox? referenceBox,
    Offset? position,
    Color? color,
    TextDirection? textDirection,
    bool? containedInkWell = false,
    Rect Function()? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return NoSplash(
      controller: controller!,
      referenceBox: referenceBox!,
      color: color!,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
  }) : super(
          controller: controller,
          referenceBox: referenceBox,
          color: color,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
