import 'package:zuunimelist/app/modules/models/person_model.dart';

class AnimeVoiceActorModel {
  final PersonModel person;
  final String language;

  AnimeVoiceActorModel({required this.person, required this.language});

  factory AnimeVoiceActorModel.fromJson(Map<String, dynamic> json) {
    return AnimeVoiceActorModel(
      person: PersonModel.fromJson(json["person"]),
      language: json["language"] ?? "",
    );
  }
}
