import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoverBackground extends StatelessWidget {
  final String? images;
  const CoverBackground({super.key, this.images});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.35,
        clipBehavior: Clip.hardEdge,
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0, 0.8],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(images!),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 220,
          color: Colors.black.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
