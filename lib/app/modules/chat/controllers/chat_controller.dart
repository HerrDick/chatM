import 'package:chat/app/models/chat_message/chat_message.dart';
import 'package:chat/app/services/socket_service.dart';
import 'package:chat/app/services/user_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
 RxList<ChatMessage> get messages => UserService.to.messages;

  @override
  void onInit() {
    super.onInit();
  }
disconnect()=>SocketService.to.disconnect();

}
