import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textController = TextEditingController();

  void singIn(){
    String username = textController.text;
  }
}
