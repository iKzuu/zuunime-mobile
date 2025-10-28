class AnimeEntityModel {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  AnimeEntityModel({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory AnimeEntityModel.fromJson(Map<String, dynamic> json) {
    return AnimeEntityModel(
      malId: json["mal_id"],
      type: json["type"],
      name: json["name"],
      url: json["url"],
    );
  }
}