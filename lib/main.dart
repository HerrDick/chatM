import 'package:chat/app/services/socket_service.dart';
import 'package:chat/app/services/user_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async{
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    ),
  );
}
Future<void> initServices()async{
  await Get.putAsync(() => SocketService().init());
  await Get.putAsync(() => UserService().init());
}
