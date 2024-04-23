import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: 
          Obx(()=>ListView.builder(itemBuilder: (Context, index){
            var message=controller.messages[index];
            return Text("${message.username}  ${message.message}");
          },
          itemCount: controller.messages.length,
          ))
          )
        ],
      )
    );
  }
}
