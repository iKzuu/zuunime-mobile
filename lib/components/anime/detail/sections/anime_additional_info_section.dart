import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';
import 'package:zuunimelist/components/anime/detail/components/additional_info_text.dart';

class AnimeAdditionalInfoSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeAdditionalInfoSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final aired = anime.aired;
    final from = aired?.prop?.from?.formattedDate ?? "-";
    final to = aired?.prop?.to?.formattedDate ?? "-";

    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdditionalInfoText(
            infoText: anime.titleEn,
            headText: "English Title",
            headTextcolor: Color(0xFFC4C4C4),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdditionalInfoText(
                        infoText: anime.source,
                        headText: "Source",
                        headTextcolor: Color(0xFFC4C4C4),
                      ),
                      AdditionalInfoText(
                        // taking the first studio in the list mwehhe
                        infoText:
                            anime.studios != null && anime.studios!.isNotEmpty
                            ? anime.studios!.first.name
                            : "Unknown Studio",
                        headText: "Studios",
                        headTextcolor: Color(0xFFC4C4C4),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdditionalInfoText(
                        infoText: anime.formattedSeason,
                        headText: "Season",
                        headTextcolor: Color(0xFFC4C4C4),
                      ),
                      AdditionalInfoText(
                        infoText: "$from to $to",
                        headText: "Aired",
                        headTextcolor: Color(0xFFC4C4C4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
