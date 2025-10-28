import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';

class AnimeHeaderSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeHeaderSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final aired = anime.aired;
    final from = aired?.prop?.from?.formattedDate ?? "-";
    // final to = aired?.prop?.to?.formattedDate ?? "-";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // aired and season
        Row(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              from,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            Container(
              width: 68,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF242424),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                anime.formattedSeason,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),

        // anime title
        Text(
          anime.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
