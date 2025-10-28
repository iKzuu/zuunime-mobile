class AnimeImageModel {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  AnimeImageModel({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory AnimeImageModel.fromJson(Map<String, dynamic> json) {
    return AnimeImageModel(
      imageUrl: json["image_url"],
      smallImageUrl: json["small_image_url"],
      largeImageUrl: json["large_image_url"],
    );
  }
}