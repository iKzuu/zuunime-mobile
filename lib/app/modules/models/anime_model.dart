import 'package:zuunimelist/app/modules/models/anime_image_model.dart';
import 'package:zuunimelist/utils/formatter.dart';

class Anime {
  final int malId;
  final String title;
  final AnimeImageModel? jpg;
  final AnimeImageModel? webp;
  final String? type;
  final String? season;
  final num? score;
  final num? episodes;
  final num? members;

  Anime({
    required this.malId,
    required this.title,
    this.jpg,
    this.webp,
    this.type,
    this.season,
    this.score,
    this.episodes,
    this.members,
  });

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
      type: json["type"] ?? "unknown",
      season: json["season"] ?? "unknown",
      episodes: json["episodes"] ?? 0,
      score: json["score"] ?? 0,
      members: json["members"] ?? 0,
    );
  }

  String get formattedSeason => capitalize(season!);
  String get formattedEpisodes => formatNumber(episodes);
  String get formattedScore => formatDecimal(score);
  String get formattedMembers => formatNumber(members);
}
