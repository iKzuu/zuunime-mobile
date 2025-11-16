import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zuunimelist/app/modules/models/anime_model.dart';

class AnimeSearchController extends GetxController {
  final baseUrl = dotenv.env['API_BASE_URL'];
  var searchAnimeList = <Anime>[].obs;
  final RxString searchQuery = "".obs;
  final RxBool isSearching = false.obs;

  final RxBool isSearchOpen = false.obs;
  final FocusNode searchFocusNode = FocusNode();

  @override
  void onClose() {
    searchFocusNode.dispose();
    super.onClose();
  }

  void handleSearchTap() {
    if (!isSearchOpen.value) {
      isSearchOpen.value = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        searchFocusNode.requestFocus();
      });
    } else {
      if (searchFocusNode.hasFocus) {
        searchFocusNode.unfocus();
      } else {
        searchFocusNode.requestFocus();
      }
    }
  }

  void closeSearch() {
    isSearchOpen.value = false;
    searchFocusNode.unfocus();
  }

  // search filtering btw
  @override
  void onInit() {
    super.onInit();
    debounce(
      searchQuery,
      (q) => searchAnime(q),
      time: const Duration(milliseconds: 600),
    );
  }

  Future<void> searchAnime(String query) async {
    if (query.isEmpty) {
      return;
    }

    try {
      isSearching.value = true;
      final response = await http.get(
        Uri.parse("$baseUrl/anime?q=$query&limit=20"),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> animeData = data["data"];
        final List<Anime> parsedList = animeData
            .map((e) => Anime.fromJson(e))
            .toList();
        searchAnimeList.value = parsedList;
      } else {
        Get.snackbar("Error", "Failed to search (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isSearching.value = false;
    }
  }


}
