import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_entity_model.dart';
import 'package:zuunimelist/components/anime/detail/components/info_chips.dart';

class AlternatifGenreList extends StatelessWidget {
  final int genresPerRow = 3;
  final List<AnimeEntityModel> genres;
  const AlternatifGenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: List.generate((genres.length / genresPerRow).ceil(), (
        rowIndex,
      ) {
        int startIndex = rowIndex * genresPerRow;
        int endIndex = (startIndex + genresPerRow < genres.length)
            ? startIndex + genresPerRow
            : genres.length;
        List<AnimeEntityModel> rowItems = genres.sublist(startIndex, endIndex);

        return Row(
          spacing: 10,
          children: rowItems.map((genre) {
            return InfoChips(
              text: genre.name,
              textColor: Colors.white,
              bgColor: Color(0xFF4EAAFF).withValues(alpha: 0.48),
              fontWeight: FontWeight.w500,
            );
          }).toList(),
        );
      }),
    );
  }
}
