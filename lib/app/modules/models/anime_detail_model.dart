import 'package:zuunimelist/app/modules/models/aired_model.dart';
import 'package:zuunimelist/app/modules/models/anime_entity_model.dart';
import 'package:zuunimelist/app/modules/models/anime_image_model.dart';
import 'package:zuunimelist/app/modules/models/broadcast_model.dart';
import 'package:zuunimelist/app/modules/models/trailer_model.dart';
import 'package:zuunimelist/utils/formatter.dart';

class AnimeDetailModel {
  final int malId;
  final String title;
  final String? titleJp;
  final String? titleEn;
  final TrailerModel? trailer;
  final AiredModel? aired;
  final AnimeImageModel? jpg;
  final AnimeImageModel? webp;
  final AnimeBroadcast? broadcast;
  final List<AnimeEntityModel>? producers;
  final List<AnimeEntityModel>? licensors;
  final List<AnimeEntityModel>? studios;
  final List<AnimeEntityModel>? genres;
  final List<AnimeEntityModel>? explicitGenres;
  final List<AnimeEntityModel>? themes;
  final List<AnimeEntityModel>? demographics;
  final String type;
  final String source;
  final num episodes;
  final String status;
  final String? duration;
  final String? rating;
  final num? score;
  final num? scoredBy;
  final num? rank;
  final num? popularity;
  final num? members;
  final num? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final bool? approved;
  final bool? airing;

  AnimeDetailModel({
    required this.malId,
    required this.title,
    this.titleJp,
    this.titleEn,
    this.trailer,
    this.aired,
    this.jpg,
    this.webp,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.approved,
    this.airing,
  });

  factory AnimeDetailModel.fromJson(Map<String, dynamic> json) {
    return AnimeDetailModel(
      malId: json["mal_id"],
      title: json["title"] ?? "",
      titleJp: json["title_japanese"],
      titleEn: json["title_english"],
      trailer: json["trailer"] != null
          ? TrailerModel.fromJson(json["trailer"])
          : null,
      aired: json["aired"] != null ? AiredModel.fromJson(json["aired"]) : null,
      jpg: json["images"]?["jpg"] != null
          ? AnimeImageModel.fromJson(json["images"]["jpg"])
          : null,
      webp: json["images"]?["webp"] != null
          ? AnimeImageModel.fromJson(json["images"]["webp"])
          : null,
      broadcast: json["broadcast"] != null
          ? AnimeBroadcast.fromJson(json["broadcast"])
          : null,
      producers: (json["producers"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      licensors: (json["licensors"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      studios: (json["studios"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      genres: (json["genres"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      explicitGenres: (json["explicit_genres"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      themes: (json["themes"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      demographics: (json["demographics"] as List?)
          ?.map((e) => AnimeEntityModel.fromJson(e))
          .toList(),
      type: json["type"] ?? "unknown",
      source: json["source"] ?? "unknown",
      episodes: json["episodes"] ?? 0,
      status: json["status"] ?? "unknown",
      duration: json["duration"] ?? 0,
      rating: json["rating"] ?? "unknown",
      score: json["score"] ?? 0,
      scoredBy: json["scored_by"] ?? 0,
      rank: json["rank"] ?? 0,
      popularity: json["popularity"] ?? 0,
      members: json["members"] ?? 0,
      favorites: json["favorites"] ?? 0,
      synopsis: json["synopsis"] ?? "unknown",
      background: json["background"] ?? "unknown",
      season: json["season"] ?? "unknown",
      year: json["year"] ?? 0,
      approved: json["approved"],
      airing: json["airing"],
    );
  }

  String get formattedSeason => capitalize(season!);
  String get formattedScore => formatDecimal(score);
  String get formattedUsers => formatNumber(scoredBy);
  String get formattedEpisodes => formatNumber(episodes);
}
