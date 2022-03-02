import 'package:get/get.dart';
import 'package:naouma/controller/auth_controller.dart';
import 'package:naouma/controller/discovery_controller.dart';
import 'package:naouma/controller/home_controller.dart';
import 'package:naouma/controller/home_tab_controller.dart';
import 'package:naouma/controller/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeTabController());
    Get.lazyPut(() => DiscoveryController());
  }
}
