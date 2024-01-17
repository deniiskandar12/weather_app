import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:weather_app/shared/controllers/global_controller.dart';

class NoConnectionController extends GetxController {
  static NoConnectionController get to => Get.find();

  void checkConnection(context) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
    await GlobalController.to.checkConnection();

    if (GlobalController.to.isConnect.value == true) {
      EasyLoading.dismiss();
      Get.back(result: true);
    } else {
      EasyLoading.dismiss();
      PanaraInfoDialog.show(
        context,
        title: "Warning",
        message: "Your device is not connected to any network",
        buttonText: "Try again",
        onTapDismiss: () {
          Get.back();
        },
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
      );
    }
  }
}
