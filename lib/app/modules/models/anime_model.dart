import 'package:zuunimelist/app/modules/models/anime_image_model.dart';

class Anime {
  final int malId;
  final String title;
  final AnimeImageModel? jpg;
  final AnimeImageModel? webp;

  Anime({required this.malId, required this.title, this.jpg, this.webp});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json["mal_id"],
      title: json["title"],
      jpg: json["images"]?["jpg"] != null
          ? AnimeImageModel.fromJson(json["images"]["jpg"])
          : null,
      webp: json["images"]?["webp"] != null
          ? AnimeImageModel.fromJson(json["images"]["webp"])
          : null,
    );
  }
}
