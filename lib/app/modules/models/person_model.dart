import 'package:zuunimelist/app/modules/models/anime_image_model.dart';

class PersonModel {
  final int malId;
  final String name;
  final AnimeImageModel? jpg;

  PersonModel({required this.malId, required this.name, this.jpg});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      malId: json["mal_id"],
      name: json["name"],
      jpg: json["images"]?["jpg"] != null
          ? AnimeImageModel.fromJson(json["images"]["jpg"])
          : null,
    );
  }
}
