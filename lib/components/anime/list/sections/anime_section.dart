import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:zuunimelist/app/modules/models/anime_model.dart';
import 'package:zuunimelist/components/anime/list/components/anime_list.dart';

class AnimeSection extends StatelessWidget {
  final Key visibleKey;
  final String title;
  final RxBool isLoading, isLoaded;
  final RxList<Anime> list;
  final VoidCallback onVisible;

  const AnimeSection({
    super.key,
    required this.visibleKey,
    required this.title,
    required this.list,
    required this.isLoading,
    required this.isLoaded,
    required this.onVisible,
  });

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibleKey,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !isLoaded.value) {
          onVisible();
        }
      },
      child: AnimeList(
        title: title,
        list: list,
        isLoading: isLoading,
        isLoaded: isLoaded,
      ),
    );
  }
}
