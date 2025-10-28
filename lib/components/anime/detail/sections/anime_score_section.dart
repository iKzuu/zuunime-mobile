import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';

class AnimeScoreSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeScoreSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Star icon
        Icon(Icons.star_border_rounded, size: 40, color: Color(0xFFFFC300)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              anime.formattedScore,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),

            Text(
              "${anime.formattedUsers} users",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
