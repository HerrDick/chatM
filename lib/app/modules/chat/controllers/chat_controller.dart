import 'package:chat/app/models/chat_message/chat_message.dart';
import 'package:chat/app/services/socket_service.dart';
import 'package:chat/app/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> get messages => UserService.to.messages;
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final focusNode = FocusNode();
  @override
  void onInit() {
    messages.listen((p0) async {
      await Future.delayed(Duration(milliseconds: 100), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    });
    super.onInit();
  }

  disconnect() => SocketService.to.disconnect();
  bool itsMe(String clientId) => clientId == SocketService.to.clientId;

  void sendMessage() {
    var message = textController.text;
    if (messages.isNotEmpty) SocketService.to.sendMessage(message);
    textController.clear();
  }
}
