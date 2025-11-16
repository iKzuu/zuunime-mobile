import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';
import 'package:zuunimelist/app/modules/controllers/anime_search_controller.dart';

class AnimeSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeSearchController>(() => AnimeSearchController());
  }
}
