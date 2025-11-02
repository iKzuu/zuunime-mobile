import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zuunimelist/app/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ZuuNimeList());
}

class ZuuNimeList extends StatelessWidget {
  const ZuuNimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
