import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';

class AnimeDetailBackground extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeDetailBackground({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints.expand(
        height: screenHeight,
        width: screenWidth,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: anime.webp?.smallImageUrl ?? "",
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[900]),
          ),
          Container(color: Color(0xFF242424).withValues(alpha: 0.4)),
        ],
      ),
    );
  }
}
