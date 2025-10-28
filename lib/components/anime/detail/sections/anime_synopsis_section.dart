import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';

class AnimeSynopsisSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeSynopsisSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final safeText = (anime.synopsis ?? "No synopsis for this anime").trim();
    final synopsis = safeText.length > 2000
        ? safeText.substring(0, 2000) + "..."
        : safeText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          "Synopsis",
          softWrap: true,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: ReadMoreText(
            synopsis,
            trimLines: 5,
            colorClickableText: Color(0xFF4EAAFF),
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show more",
            trimExpandedText: "Show less",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
          ),
        ),
      ],
    );
  }
}
