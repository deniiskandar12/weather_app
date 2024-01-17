import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:weather_app/configs/routes/app_routes.dart';
import 'package:weather_app/modules/home/models/weather_model.dart';
import 'package:weather_app/modules/home/repositories/weather_repository.dart';
import 'package:weather_app/shared/controllers/global_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var weather = Rx(WeatherModel());
  var position = Rxn<Position>();

  @override
  void onInit() async {
    await determinePosition();
    getWeather();

    super.onInit();
  }

  Future<void> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        PanaraInfoDialog.show(
          Get.context!,
          message: 'Location permissions are denied',
          buttonText: 'Okay',
          onTapDismiss: () => Get.back(),
          panaraDialogType: PanaraDialogType.warning,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      PanaraInfoDialog.show(
        Get.context!,
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
        buttonText: 'Okay',
        onTapDismiss: () => Get.back(),
        panaraDialogType: PanaraDialogType.warning,
      );
    }
    try {
      position.value = await Geolocator.getCurrentPosition();
    } catch (_) {}
  }

  void getWeather() async {
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      WeatherModel response = await WeatherRepository.getWeather(
        lat: position()?.latitude ?? 0,
        long: position()?.longitude ?? 0,
      );
      if (response.cod == 200) {
        weather.value = response;
      } else {
        PanaraInfoDialog.show(
          Get.context!,
          title: "Warning",
          message: response.message.toString(),
          buttonText: "Okay",
          onTapDismiss: () {
            Get.back();
          },
          panaraDialogType: PanaraDialogType.warning,
          barrierDismissible: false,
        );
      }
    } else if (GlobalController.to.isConnect.value == false) {
      final data = await Get.toNamed(AppRoutes.noConnection);
      if (data) {
        onRefresh();
      }
    }
  }

  Future<void> onRefresh() async {
    await determinePosition();
    getWeather();
  }
}
