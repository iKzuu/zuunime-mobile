import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/controllers/anime_search_controller.dart';
import 'package:zuunimelist/app/modules/views/home.dart';
import 'package:zuunimelist/app/modules/views/search_view.dart';
import 'package:zuunimelist/components/widget/appbar_content.dart';
import 'package:get/get.dart';

class WidgetWrapper extends StatelessWidget {
  const WidgetWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimeSearchController controller = Get.find();

    return SafeArea(
      child: Obx(() {
        final isSearchOpen = controller.isSearchOpen.value;
        return PopScope(
          canPop: !isSearchOpen,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop && isSearchOpen) {
              controller.closeSearch();
            }
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            // resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Color(0xFF242424),
              toolbarHeight: 130,
              flexibleSpace: AppbarContent(
                onChanged: (value) => controller.searchQuery.value = value,
                onSearchTap: controller.handleSearchTap,
                focusNode: controller.searchFocusNode,
                isSearchOpen: isSearchOpen,
              ),
            ),
            body: Stack(
              children: [
                Visibility(
                  visible: !isSearchOpen,
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    children: [HomePage()],
                  ),
                ),

                Offstage(
                  offstage: !isSearchOpen,
                  child: Positioned.fill(child: SearchView()),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
