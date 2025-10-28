import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_model.dart';
import 'package:zuunimelist/components/anime/list/components/anime_content.dart';
import 'package:zuunimelist/components/effect/anime_shimmer.dart';

class AnimeList extends StatelessWidget {
  final String title;
  final RxList<Anime> list;
  final RxBool isLoading;
  final RxBool isLoaded;
  const AnimeList({
    super.key,
    required this.title,
    required this.list,
    required this.isLoading,
    required this.isLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!isLoaded.value) {
        return const AnimeShimmerLoading();
      }

      if (isLoading.value) {
        return const AnimeShimmerLoading();
      }

      if (list.isEmpty) {
        return const Center(child: Text("No data found"));
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 10,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 242,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: min(list.length, 6),
                itemBuilder: (context, index) {
                  final anime = list[index];
                  return AnimeContent(
                    animeId: anime.malId,
                    image: anime.webp?.imageUrl ?? "",
                    title: anime.title,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
