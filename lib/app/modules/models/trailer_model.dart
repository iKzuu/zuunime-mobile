class TrailerModel {
  final String? ytId;
  final String? url;
  final String? embedUrl;

  TrailerModel({this.ytId, this.url, this.embedUrl,});

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    String? ytId = json["youtube_id"];
    final embedUrl = json["embed_url"];

    if (ytId == null && embedUrl != null) {
      final uri = Uri.tryParse(embedUrl);
      if (uri != null && uri.pathSegments.isNotEmpty) {
        ytId = uri.pathSegments.last.split("?").first;
      }
    }

    return TrailerModel(ytId: ytId, url: json["url"], embedUrl: embedUrl);
  }

  String? get youtubeWatchUrl {
    if (ytId != null && ytId!.isNotEmpty) {
      return "https://www.youtube.com/watch?v=$ytId";
    }
    return null;
  }
}
