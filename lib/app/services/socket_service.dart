import 'package:chat/app/models/chat_message/chat_message.dart';
import 'package:chat/app/models/socket_event.dart';
import 'package:chat/app/routes/app_pages.dart';
import 'package:chat/app/services/user_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
 static SocketService get to => Get.find();
  late Socket _socket;
  Future<SocketService> init() async {
    _socket = io('https://masqed.ru',
    OptionBuilder()
    .setTransports(['websocket'])
    .setPath('/chat/socket.io')
    .disableAutoConnect()
    .disableReconnection()
    .build()
    
    );
      _socket.onConnect((data) { printInfo(info: "Socket connected");
      Get.offNamed(Routes.CHAT);
      });
    _socket.onDisconnect((data) => printInfo(info: "Disconnected"));
    _socket.onConnectError((data) => printInfo(info: "Error"));
    _socket.onAny((event, data) { 
      var isknow=SocketEvent.values.any((element) => element.name==event);
      if(!isknow) return;
    data['type']=event;
    var message = ChatMessage.fromJson(data);
    UserService.to.addMessageToList(message);
    });
    return this;
  }

  void connect(){
    _socket.connect();
  }
void disconnect(){
  _socket.disconnect();
}
}