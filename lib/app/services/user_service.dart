import 'package:get/get.dart';

class UserService extends GetxService {
 static UserService get to => Get.find();
  Future<UserService> init() async {
    return this;
  }

}