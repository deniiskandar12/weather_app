import 'package:get/get.dart';
import 'package:weather_app/shared/controllers/global_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
  }
}
