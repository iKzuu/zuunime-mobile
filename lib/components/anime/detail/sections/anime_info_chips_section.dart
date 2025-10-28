import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';
import 'package:zuunimelist/components/anime/detail/components/genre_list.dart';
import 'package:zuunimelist/components/anime/detail/components/info_chips.dart';

class AnimeInfoChipsSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeInfoChipsSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            // anime episodes
            InfoChips(text: "${anime.formattedEpisodes} Episode"),

            // anime status (On-going, finished, etc.)
            InfoChips(text: anime.status),

            // anime type (movie, tv, etc.)
            InfoChips(text: anime.type),
          ],
        ),

        // genre list (romance, school, action, etc.)
        GenreList(genres: anime.genres ?? []),
      ],
    );
  }
}
