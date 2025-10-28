import 'package:get/get.dart';
import 'package:zuunimelist/app/modules/controllers/anime_detail_controller.dart';

class AnimeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeDetailController>(() => AnimeDetailController(), fenix: true);
  }
}