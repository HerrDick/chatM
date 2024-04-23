import 'package:chat/app/modules/chat/widget/bubble_widget.dart';
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
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => controller.disconnect(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    controller: controller.scrollController,
                    itemBuilder: (Context, index) {
                      var message = controller.messages[index];
                      var itsMe = controller.itsMe(message.client);
                      switch (message.type) {
                        case SocketEvent.login:
                          return Text("${message.username} вошел в чат");
                        case SocketEvent.logout:
                          return Text("${message.username} покинул чат");
                        case SocketEvent.newMessage:
                          return BubbleWidget(message: message, itsMe: itsMe);
                        default:
                          return SizedBox();
                      }
                    },
                    itemCount: controller.messages.length,
                  )),
            ),
            Padding(padding:EdgeInsets.all(8.0),
            child:
            Container(
             
              child: TextField(
                focusNode: controller.focusNode,
                controller: controller.textController,
                onSubmitted: (value) => controller.sendMessage(),
                decoration: InputDecoration(
                  hintText: 'сообщение... ',
                    suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => controller.sendMessage(),
                )),
              ),
              ),
            )
          ],
        ));
  }
}
