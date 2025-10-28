import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';
import 'package:zuunimelist/components/anime/detail/components/no_trailer.dart';

class AnimeTrailerSection extends StatelessWidget {
  final AnimeDetailModel anime;
  const AnimeTrailerSection({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    final trailer = anime.trailer;
    final ytId = trailer?.ytId;
    final youtubeUrl = trailer?.youtubeWatchUrl;

    if (ytId == null || ytId.isEmpty) {
      return NoTrailer();
    }

    final controller = YoutubePlayerController.fromVideoId(
      videoId: ytId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        showControls: true,
        enableCaption: false,
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              if (youtubeUrl == null || youtubeUrl.isEmpty) return;
      
              final uri = Uri.parse(youtubeUrl);
              print("Launching: $uri");
      
              if (!await launchUrl(
                uri,
                mode: LaunchMode.externalApplication,
              )) {
                await launchUrl(uri, mode: LaunchMode.inAppWebView);
              }
            },
            icon: const Icon(Icons.open_in_new, color: Color(0xFF4EAAFF)),
            label: const Text(
              "Watch Trailer on YouTube",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
