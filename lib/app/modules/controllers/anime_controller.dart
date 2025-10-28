import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zuunimelist/app/modules/models/anime_model.dart';

class AnimeController extends GetxController {
  final String baseUrl = "https://api.jikan.moe/v4";
  var topAnimeList = <Anime>[].obs;
  var recommendationList = <Anime>[].obs;
  var upcomingAnimeList = <Anime>[].obs;
  var seasonNowAnimeList = <Anime>[].obs;
  var recentWatchAnimeList = <Anime>[].obs;

  var isLoadedTop = false.obs;
  var isLoadedRec = false.obs;
  var isLoadedUpcoming = false.obs;
  var isLoadedSeasonNow = false.obs;
  var isLoadedRecentWatch = false.obs;

  var isLoading = false.obs;
  var isLoadingTop = false.obs;
  var isLoadingRec = false.obs;
  var isLoadingUpcoming = false.obs;
  var isLoadingSeasonNow = false.obs;
  var isLoadingRecentWatch = false.obs;

  Future<void> fetchUpcomingAnime() async {
    if (isLoadedUpcoming.value) return;
    await _fetchAnime(
      "$baseUrl/seasons/upcoming",
      targetList: upcomingAnimeList,
      isLoading: isLoadingUpcoming,
    );
    isLoadedUpcoming.value = true;
  }

  Future<void> fetchSeasonNow() async {
    if (isLoadedSeasonNow.value) return;
    await _fetchAnime(
      "$baseUrl/seasons/now",
      targetList: seasonNowAnimeList,
      isLoading: isLoadingSeasonNow,
    );
    isLoadedSeasonNow.value = true;
  }

  Future<void> fetchTopAnime() async {
    if (isLoadedTop.value) return;
    await _fetchAnime(
      "$baseUrl/top/anime",
      targetList: topAnimeList,
      isLoading: isLoadingTop,
    );
    isLoadedTop.value = true;
  }

  Future<void> fetchRecommendationAnime() async {
    if (isLoadedRec.value) return;
    await _fetchAnime(
      "$baseUrl/recommendations/anime",
      targetList: recommendationList,
      isLoading: isLoadingRec,
      hasEntryField: true,
    );
    isLoadedRec.value = true;
  }

  Future<void> fetchRecentWatchAnime() async {
    if (isLoadedRecentWatch.value) return;
    await _fetchAnime(
      "$baseUrl/watch/episodes",
      targetList: recentWatchAnimeList,
      isLoading: isLoadingRecentWatch,
      hasEntryField: true,
    );
    isLoadedRecentWatch.value = true;
  }

  Future<void> _fetchAnime(
    String url, {
    required RxList<Anime> targetList,
    required RxBool isLoading,
    bool hasEntryField = false,
  }) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> animeData = data["data"];
        final List<Anime> parsedList = [];

        for (var item in animeData) {
          if (hasEntryField && item["entry"] != null) {
            if (item["entry"] is List) { // if the entry is an list
              parsedList.addAll(
                (item["entry"] as List).map((e) => Anime.fromJson(e)).toList(),
              );
            } else if (item["entry"] is Map<String, dynamic>) { // if the entry is an object
              parsedList.add(Anime.fromJson(item["entry"]));
            }
          } else {
            parsedList.add(Anime.fromJson(item));
          }
        }
        
        targetList.value = parsedList;
      } else {
        if (targetList.isEmpty) {
          Get.snackbar(
            "Error",
            "Unable to load  data (${response.statusCode})",
          );
        }
      }
    } catch (e) {
      if (targetList.isEmpty) {
        Get.snackbar("Error", e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }
}
