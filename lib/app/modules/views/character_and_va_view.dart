import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/controllers/anime_detail_controller.dart';
import 'package:get/get.dart';

class CharacterAndVoiceActor extends StatelessWidget {
  CharacterAndVoiceActor({super.key});

  final AnimeDetailController animeDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFFF544CF),
        title: Text(
          "Characters & Voice Actors",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          final characters = animeDetailController.animeCharacter;

          if (characters.isEmpty) {
            return const SizedBox(
              height: 280,
              child: Center(
                child: CircularProgressIndicator(color: Color(0xFF4EAAFF)),
              ),
            );
          }

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];

              final mainSeiyuu = (character.voiceActors.isNotEmpty)
                  ? character.voiceActors.firstWhere(
                      (va) => va.language.toLowerCase() == "japanese",
                      orElse: () => character.voiceActors.first,
                    )
                  : null;

              final characterImage =
                  character.webp?.imageUrl ?? character.jpg?.imageUrl;

              final seiyuuImage = mainSeiyuu?.person.jpg?.imageUrl;

              final seiyuuName = mainSeiyuu?.person.name ?? "Unknown";

              return ListTile(
                title: Text(
                  "${character.name} (${character.role})",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  seiyuuName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
