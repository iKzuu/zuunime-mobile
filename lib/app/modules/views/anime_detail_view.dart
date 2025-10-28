import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuunimelist/app/modules/controllers/anime_detail_controller.dart';
import 'package:zuunimelist/components/anime/detail/sections/anime_detail_content.dart';

class AnimeDetailView extends StatelessWidget {
  AnimeDetailView({super.key});

  final AnimeDetailController animeDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.3),
      body: SafeArea(
        child: Obx(() {
          if (animeDetailController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF4EAAFF)),
            );
          }

          if (animeDetailController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(animeDetailController.errorMessage.value),
            );
          }

          final anime = animeDetailController.animeDetail.value;
          if (anime == null) {
            return const Center(child: Text("No Data available"));
          }

          return AnimeDetailContent(anime: anime);
        }),
      ),
    );
  }
}
