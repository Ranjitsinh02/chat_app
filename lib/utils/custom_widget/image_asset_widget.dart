import 'package:flutter/material.dart';

class ImageAssetWidget extends StatelessWidget {
  const ImageAssetWidget({
    super.key,
    required this.image, this.height = 25, this.width = 25, this.color,
  });
  final Color? color;
  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      color: color,
    );
  }
}
