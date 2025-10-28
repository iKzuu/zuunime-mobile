import 'package:flutter/widgets.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';
import 'package:zuunimelist/components/anime/detail/components/anime_cover.dart';
import 'package:zuunimelist/components/anime/detail/components/cover_background.dart';

class AnimeCoverSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeCoverSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // cover background
        CoverBackground(images: anime.webp?.largeImageUrl),
        // anime cover
        AnimeCover(images: anime.webp?.largeImageUrl),
      ],
    );
  }
}
