import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        
      ),
      body: Center(
        child: Container(
          width: 350,
          child: TextField(
             decoration: InputDecoration(
              labelText: 'nickname'
            ),
            controller: controller.textController,
            onSubmitted: (value) => controller.singIn(),
           
          ),
        )
      ),
    );
  }
}
