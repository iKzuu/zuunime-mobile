import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuunimelist/app/modules/controllers/anime_search_controller.dart';

class SearchView extends StatelessWidget {
  final AnimeSearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      height: screenHeight,
      child: Obx(() {
        if (controller.isSearching.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF4EAAFF)),
          );
        }

        if (controller.searchQuery.isEmpty ||
            controller.searchAnimeList.isEmpty) {
          return const Center(
            child: Text(
              "No anime found yet",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.searchAnimeList.length,
          itemBuilder: (context, index) {
            final anime = controller.searchAnimeList[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed("/anime-detail", arguments: anime.malId);
              },
              child: ListTile(
                title: Text(
                  anime.title,
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(anime.type ?? ""),
              ),
            );
          },
        );
      }),
    );
  }
}
