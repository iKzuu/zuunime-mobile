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
    debugPrint("Parsed ytId: ${anime.trailer?.ytId}");
    final controller = anime.trailer?.playerController;

    if (controller == null) {
      return const NoTrailer();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: YoutubePlayerScaffold(
        controller: controller,
        builder: (context, player) {
          return Column(
            children: [
              AspectRatio(aspectRatio: 16 / 9, child: player),
              TextButton.icon(
                onPressed: () {
                  final url = anime.trailer?.youtubeWatchUrl;
                  if (url != null) {
                    launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
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
          );
        },
      ),
    );
  }
}
