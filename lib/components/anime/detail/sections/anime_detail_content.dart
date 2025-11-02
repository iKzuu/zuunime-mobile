import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuunimelist/app/modules/controllers/anime_detail_controller.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_additional_info_section.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_characters_and_seiyuu_section.dart';
// import 'package:zuunimelist/components/anime_detail_components/background.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_cover_section.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_header_section.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_info_chips_section.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_score_section.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_synopsis_section.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_trailer_section.dart';

class AnimeDetailContent extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeDetailContent({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final AnimeDetailController controller = Get.find();

    return Stack(
      children: [
        // background
        // AnimeDetailBackground(anime: anime),

        // detail content
        SingleChildScrollView(
          child: Column(
            spacing: 14,
            children: [
              // cover section
              AnimeCoverSection(anime: anime),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  spacing: 16,
                  children: [
                    // header section (title, aired, season)
                    AnimeHeaderSection(anime: anime),

                    // anime score
                    AnimeScoreSection(anime: anime),

                    // anime info chips section
                    AnimeInfoChipsSection(anime: anime),

                    // anime synopsis section
                    AnimeSynopsisSection(anime: anime),

                    // anime trailer section
                    AnimeTrailerSection(anime: anime),

                    // anime additional info section
                    AnimeAdditionalInfoSection(anime: anime),

                    // anime characters and seiyuu section (reactive character section)
                    Obx(() {
                      final characters = controller.animeCharacter;
                      debugPrint(
                        '[AnimeDetailContent] Obx triggered -> characters count: ${characters.length}',
                      );
                      if (characters.isEmpty) {
                        return const SizedBox(
                          height: 280,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF4EAAFF),
                            ),
                          ),
                        );
                      }
                      return AnimeCharactersAndSeiyuuSection(
                        character: characters,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),

        // back button
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            onPressed: Get.back,
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
