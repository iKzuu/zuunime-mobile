import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterBox extends StatelessWidget {
  final String? picture;
  final String? name;
  const CharacterBox({super.key, required this.picture, required this.name});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CharacterBox] Build -> name: $name, picture: $picture');
    final safeImageUrl = (picture != null && picture!.isNotEmpty)
        ? picture!
        : "https://placehold.co/64x100.webp?text=VA&font=poppins";

    return Expanded(
      child: SizedBox(
        width: 64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: safeImageUrl,
                fit: BoxFit.cover,
                height: 100,
                placeholder: (context, url) {
                  debugPrint('[CharacterBox] Loading placeholder for: $url');
                  return Container(color: Colors.grey[900]);
                },
                errorWidget: (context, url, error) {
                  debugPrint('[CharacterBox] ERROR loading: $url -> $error');
                  return const Icon(
                    Icons.broken_image_rounded,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            Text(
              name ?? "-",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
