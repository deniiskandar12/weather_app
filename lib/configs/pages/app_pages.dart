import 'package:get/get.dart';
import 'package:weather_app/configs/routes/app_routes.dart';
import 'package:weather_app/modules/home/bindings/home_binding.dart';
import 'package:weather_app/modules/home/views/ui/home_view.dart';
import 'package:weather_app/modules/no_connection/bindings/no_connection_binding.dart';
import 'package:weather_app/modules/no_connection/views/ui/no_connection_view.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages() {
    return [
      GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: AppRoutes.noConnection,
        page: () => const NoConnectionView(),
        binding: NoConnectionBinding(),
      ),
    ];
  }
}
