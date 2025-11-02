import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:zuunimelist/app/modules/models/anime_character_model.dart';
import 'package:zuunimelist/components/anime/detail/components/character_box.dart';

class CharactersAndSeiyuu extends StatelessWidget {
  final AnimeCharacterModel character;
  const CharactersAndSeiyuu({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CharactersAndSeiyuu] Build → character: ${character.name}');
    final mainSeiyuu = (character.voiceActors.isNotEmpty)
        ? character.voiceActors.firstWhere(
            (va) => va.language.toLowerCase() == "japanese",
            orElse: () => character.voiceActors.first,
          )
        : null;

    debugPrint(
      '[CharactersAndSeiyuu] Seiyuu → ${mainSeiyuu?.person.name ?? "Unknown"}',
    );

    final characterImage =
        character.webp?.imageUrl ??
        character.jpg?.imageUrl;

    final seiyuuImage =
        mainSeiyuu?.person.jpg?.imageUrl;

    final seiyuuName = mainSeiyuu?.person.name ?? "Unknown";

    return VisibilityDetector(
      key: Key(
        'characterAndSeiyuu_${character.name}_${mainSeiyuu?.person.name ?? "Unknown"}',
      ),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          debugPrint(
            '[VisibilityDetector] ${character.name} terlihat di layar (${(info.visibleFraction * 100).toStringAsFixed(1)}%)',
          );
        } else {
          debugPrint('[VisibilityDetector] ${character.name} tidak terlihat.');
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 20,
        children: [
          CharacterBox(picture: characterImage, name: character.name),
          CharacterBox(picture: seiyuuImage, name: seiyuuName),
        ],
      ),
    );
  }
}
