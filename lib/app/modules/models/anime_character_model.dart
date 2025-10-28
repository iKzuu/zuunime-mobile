import 'package:zuunimelist/app/modules/models/anime_image_model.dart';

class AnimeCharacterModel {
  final int malId;
  final String name;
  final String role;
  final AnimeImageModel? jpg;
  final AnimeImageModel? webp;
  final List<AnimeVoiceActors> voiceActors;

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
      jpg: json["images"]?["jpg"] != null
          ? AnimeImageModel.fromJson(json["images"]["jpg"])
          : null,
      webp: json["images"]?["webp"] != null
          ? AnimeImageModel.fromJson(json["images"]["webp"])
          : null,
      voiceActors: (json["voice_actors"] as List)
          .map((va) => AnimeVoiceActors.fromJson(va))
          .toList(),
    );
  }
}

class AnimeVoiceActors {
  final int malId;
  final String name;
  final String imageUrl;
  final String language;

  AnimeVoiceActors({
    required this.malId,
    required this.name,
    required this.imageUrl,
    required this.language,
  });

  factory AnimeVoiceActors.fromJson(Map<String, dynamic> json) {
    return AnimeVoiceActors(
      malId: json["person"]["mal_id"],
      name: json["person"]["name"],
      imageUrl: json["person"]["images"]["jpg"]["image_url"],
      language: json["language"] ?? "",
    );
  }
}
