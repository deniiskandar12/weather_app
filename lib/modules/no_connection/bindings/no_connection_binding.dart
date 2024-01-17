import 'package:get/get.dart';
import 'package:weather_app/modules/no_connection/controllers/no_connection_controller.dart';

class NoConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NoConnectionController());
  }
}
