import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeCover extends StatelessWidget {
  final String? images;
  const AnimeCover({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      left: 20,
      top: 20,
      bottom: 20,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: images!,
            fit: BoxFit.cover,
            width: 160,
            height: 220,
            placeholder: (context, url) => Container(color: Colors.grey[900]),
          ),
        ),
      ),
    );
  }
}
