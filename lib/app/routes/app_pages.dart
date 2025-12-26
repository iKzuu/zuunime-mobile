import 'package:get/get.dart';
import 'package:zuunimelist/app/bindings/AnimeBinding.dart';
import 'package:zuunimelist/app/bindings/AnimeDetailBinding.dart';
import 'package:zuunimelist/app/bindings/AnimeSearchBinding.dart';
import 'package:zuunimelist/app/modules/views/anime_detail_view.dart';
import 'package:zuunimelist/app/modules/views/character_and_va_view.dart';
import 'package:zuunimelist/app/modules/views/home.dart';
import 'package:zuunimelist/components/widget/widget_wrapper.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.WIDGET_WRAPPER,
      page: () => WidgetWrapper(),
      bindings: [AnimeBinding(), AnimeSearchBinding()],
    ),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(
      name: Routes.ANIME_DETAIL,
      page: () => AnimeDetailView(),
      binding: AnimeDetailBinding(),
    ),
    GetPage(
      name: Routes.ALL_CHARACTERS_VA,
      page: () => CharacterAndVoiceActor(),
      binding: AnimeDetailBinding(),
    ),
  ];
}
