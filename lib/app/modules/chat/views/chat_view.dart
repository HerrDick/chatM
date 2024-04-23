
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:chat/app/models/socket_event.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        leading: IconButton(icon: Icon(Icons.exit_to_app), onPressed: ()=> controller.disconnect(),),
      
      ),
      body: Column(
        children: [
          Expanded(child: 
          Obx(()=>ListView.builder(itemBuilder: (Context, index){
            var message=controller.messages[index];
            switch (message.type){
              case SocketEvent.login:
              return Text("${message.username} вошел в чат");
              case SocketEvent.logout:
              return Text("${message.username} покинул чат");
              case SocketEvent.newMessage:
              return Text("${message.username}  ${message.message}");
              default:
              return SizedBox();
            }
          },
          itemCount: controller.messages.length,
          )),
          
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(color: Colors.blue),
            child: TextField(
              focusNode: controller.focusNode,
              controller: controller.textController,
              onSubmitted: (value) => controller.sendMessage(),
              
              decoration: InputDecoration(suffixIcon:IconButton( icon: Icon(Icons.send), onPressed: ()=>controller.sendMessage(),)
              ),
            ),
          )
        ],
      )
    );
  }
}
