import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerModel {
  final String? ytId;
  final String? url;
  final String? embedUrl;

  TrailerModel({this.ytId, this.url, this.embedUrl});

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    String? ytId = json["youtube_id"];
    final embedUrl = json["embed_url"];

    if ((ytId == null || ytId.isEmpty) && embedUrl != null) {
      final uri = Uri.tryParse(embedUrl);
      final validHost = ["youtube.com", "youtube-nocookie.com"];
      if (uri != null && validHost.any((host) => uri.host.contains(host))) {
        final segments = uri.pathSegments;
        if (segments.length >= 2 && segments.first == "embed") {
          ytId = segments[1];
        } else if (segments.isNotEmpty) {
          ytId = segments.last.split("?").first;
        }
      }
    }
    return TrailerModel(ytId: ytId, url: json["url"], embedUrl: embedUrl);
  }

  YoutubePlayerController? get playerController {
    if (ytId != null && ytId!.isNotEmpty) {
      return YoutubePlayerController.fromVideoId(
        videoId: ytId!,
        params: YoutubePlayerParams(showControls: true, showFullscreenButton: false, enableJavaScript: true),
      );
    }
    return null;
  }

  String? get youtubeWatchUrl {
    if (ytId != null && ytId!.isNotEmpty) {
      return "https://www.youtube.com/watch?v=$ytId";
    }
    return null;
  }
}
