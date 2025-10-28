import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zuunimelist/app/modules/models/anime_character_model.dart';
import 'package:zuunimelist/app/modules/models/anime_detail_model.dart';

class AnimeDetailController extends GetxController {
  final String baseUrl = "https://api.jikan.moe/v4";
  final animeDetail = Rxn<AnimeDetailModel>();
  final animeCharacter = <AnimeCharacterModel>[].obs;
  final isLoading = true.obs;
  final errorMessage = "".obs;
  final _cahce = <int, AnimeDetailModel>{};

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments as int;
    loadAnimeDetail(id);
  }

  Future<void> loadAnimeDetail(int id) async {
    if (animeDetail.value != null && animeCharacter.isNotEmpty) return;
    if (_cahce.containsKey(id)) {
      animeDetail.value = _cahce[id];
      return;
    }
    try {
      isLoading.value = true;
      errorMessage.value = "";
      animeDetail.value = null;
      animeCharacter.clear();

      await Future.wait([fetchAnimeDetail(id), fetchAnimeCharacter(id)]);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAnimeDetail(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/anime/$id"));
    if (response.statusCode == 200) {
      final animeDetailData = jsonDecode(response.body);
      final detail = AnimeDetailModel.fromJson(animeDetailData["data"]);
      animeDetail.value = detail;
      _cahce[id] = detail;
      print("Trailer data: ${animeDetailData["data"]["trailer"]}");
    } else {
      throw Exception("Failed to load anime detail (${response.statusCode})");
    }
  }

  Future<void> fetchAnimeCharacter(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/anime/$id/characters"));
    if (response.statusCode == 200) {
      final characterData = jsonDecode(response.body);
      animeCharacter.value = (characterData["data"] as List)
          .map((e) => AnimeCharacterModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load anime detail (${response.statusCode})");
    }
  }
}
