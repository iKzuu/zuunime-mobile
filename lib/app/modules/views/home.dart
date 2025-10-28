import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuunimelist/app/modules/controllers/anime_controller.dart';
import 'package:zuunimelist/components/anime/list/sections/anime_section.dart';
import 'package:zuunimelist/components/widget/appbar_content.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AnimeController animeController = Get.find<AnimeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFF242424),
          toolbarHeight: 130,
          flexibleSpace: AppbarContent(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 14),
            child: Column(
              children: [
                // Top Anime List
                AnimeSection(
                  visibleKey: Key("topAnime"),
                  title: "Top Anime",
                  list: animeController.topAnimeList,
                  isLoading: animeController.isLoadingTop,
                  isLoaded: animeController.isLoadedTop,
                  onVisible: animeController.fetchTopAnime,
                ),

                SizedBox(height: 18),

                // Upcoming Anime List
                AnimeSection(
                  visibleKey: Key("upcomingAnime"),
                  title: "Upcoming",
                  list: animeController.upcomingAnimeList,
                  isLoading: animeController.isLoadingUpcoming,
                  isLoaded: animeController.isLoadedUpcoming,
                  onVisible: animeController.fetchUpcomingAnime,
                ),

                SizedBox(height: 18),

                // Recommendation List
                AnimeSection(
                  visibleKey: Key("recommendationAnime"),
                  list: animeController.recommendationList,
                  isLoading: animeController.isLoadingRec,
                  isLoaded: animeController.isLoadedRec,
                  title: "Recommendation",
                  onVisible: animeController.fetchRecommendationAnime,
                ),

                SizedBox(height: 18),

                // Season Now List
                AnimeSection(
                  visibleKey: Key("seasonNowAnime"),
                  list: animeController.seasonNowAnimeList,
                  isLoading: animeController.isLoadingSeasonNow,
                  isLoaded: animeController.isLoadedSeasonNow,
                  title: "This Season",
                  onVisible: animeController.fetchSeasonNow,
                ),

                SizedBox(height: 18),

                AnimeSection(
                  visibleKey: Key("recentWatch"),
                  title: "Watch Recent Episodes",
                  list: animeController.recentWatchAnimeList,
                  isLoading: animeController.isLoadingRecentWatch,
                  isLoaded: animeController.isLoadedRecentWatch,
                  onVisible: animeController.fetchRecentWatchAnime,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
