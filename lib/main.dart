import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuunimelist/app/routes/app_pages.dart';

void main() {
  runApp(const ZuuNimeList());
}

class ZuuNimeList extends StatelessWidget {
  const ZuuNimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
