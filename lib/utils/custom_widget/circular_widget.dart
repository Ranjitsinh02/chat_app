import 'package:flutter/material.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: CircleAvatar(
        minRadius: 40,
        maxRadius: 40,
        child: Image.asset(image),
      ),
    );
  }
}
