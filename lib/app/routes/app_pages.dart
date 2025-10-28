import 'package:get/get.dart';
import 'package:zuunimelist/app/bindings/AnimeBinding.dart';
import 'package:zuunimelist/app/bindings/AnimeDetailBinding.dart';
import 'package:zuunimelist/app/modules/views/anime_detail_view.dart';
import 'package:zuunimelist/app/modules/views/home.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: AnimeBinding()),
    GetPage(
      name: Routes.ANIME_DETAIL,
      page: () => AnimeDetailView(),
      binding: AnimeDetailBinding(),
    ),
  ];
}
