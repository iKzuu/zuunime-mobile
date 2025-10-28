import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_entity_model.dart';
import 'package:zuunimelist/components/anime/detail/components/info_chips.dart';

class GenreList extends StatelessWidget {
  final List<AnimeEntityModel> genres;
  final int genresPerRow = 3;
  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: genres.map((genre) {
        return IntrinsicWidth(
          child: InfoChips(
            text: genre.name,
            fontWeight: FontWeight.w500,
            textColor: Colors.white,
            bgColor: Color(0xFF4EAAFF).withValues(alpha: 0.4),
          ),
        );
      }).toList(),
    );
  }
}
