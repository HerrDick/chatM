import 'package:chat/app/services/socket_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
 static UserService get to => Get.find();

 String username = "";
 List message =[].obs;
  Future<UserService> init() async {
    return this;
  }
void setUsernameConnected(String user){
  username=user;
  SocketService.to.connect();
}
}