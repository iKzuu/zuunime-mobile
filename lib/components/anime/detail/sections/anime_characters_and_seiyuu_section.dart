import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_character_model.dart';
import 'package:zuunimelist/components/anime/detail/components/characters_and_seiyuu.dart';

class AnimeCharactersAndSeiyuuSection extends StatelessWidget {
  final List<AnimeCharacterModel>? character;
  final int maxDisplayedCharacter;
  const AnimeCharactersAndSeiyuuSection({
    super.key,
    required this.character,
    this.maxDisplayedCharacter = 8,
  });

  @override
  Widget build(BuildContext context) {
    final characters = character ?? [];

    final limitedCharactersToDisplay = characters.length > maxDisplayedCharacter
        ? characters.sublist(0, maxDisplayedCharacter)
        : characters;

    debugPrint(
      '[AnimeCharactersAndSeiyuuSection] Build -> Total characters: ${characters.length}',
    );
    return Column(
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Characters & Voice Actors",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),

            GestureDetector(
              onTap: () {},
              child: Text(
                "See all",
                style: TextStyle(
                  color: Color(0xFF4EAAFF),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12,
              children: limitedCharactersToDisplay.map((char) {
                return CharactersAndSeiyuu(character: char);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
