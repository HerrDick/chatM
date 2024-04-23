import 'package:chat/app/routes/app_pages.dart';
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
    _socket.onAny((event, data) => printInfo(info: "event: $event $data"));
    return this;
  }

  void connect(){
    _socket.connect();
  }
void disconnect(){
  _socket.disconnect();
}
}