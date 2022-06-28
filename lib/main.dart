import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poke_romeo/app/controller/masterController.dart';
import 'package:poke_romeo/app/service/servicios.dart';
import 'package:poke_romeo/themes/theme.dart';

import 'app/routes/app_pages.dart';

Future<void> initSevice() async {
  Get.put(MasterController());
  Get.put(Luminarias());
  Get.put(ApiInject());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSevice();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      darkTheme: TemaApp().darkTheme,
      theme: TemaApp().lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
