import 'package:zuunimelist/app/modules/models/anime_image_model.dart';
import 'package:zuunimelist/app/modules/models/anime_voice_actor_model.dart';

class AnimeCharacterModel {
  final int malId;
  final String name;
  final String role;
  final AnimeImageModel? jpg;
  final AnimeImageModel? webp;
  final List<AnimeVoiceActorModel> voiceActors;

  AnimeCharacterModel({
    required this.malId,
    required this.name,
    required this.role,
    required this.voiceActors,
    this.jpg,
    this.webp,
  });

  factory AnimeCharacterModel.fromJson(Map<String, dynamic> json) {
    return AnimeCharacterModel(
      malId: json["character"]["mal_id"],
      name: json["character"]["name"],
      role: json["role"],
      jpg: json["character"]["images"]?["jpg"] != null
          ? AnimeImageModel.fromJson(json["character"]["images"]["jpg"])
          : null,
      webp: json["character"]["images"]?["webp"] != null
          ? AnimeImageModel.fromJson(json["character"]["images"]["webp"])
          : null,
      voiceActors: (json["voice_actors"] as List? ?? [])
          .map((va) => AnimeVoiceActorModel.fromJson(va))
          .toList(),
    );
  }
}
