import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/configs/pages/app_pages.dart';
import 'package:weather_app/configs/routes/app_routes.dart';
import 'package:weather_app/configs/themes/app_theme.dart';
import 'package:weather_app/shared/bindings/global_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        },
        child: GetMaterialApp(
          title: 'Wheater App',
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages(),
          initialRoute: AppRoutes.home,
          theme: AppTheme.theme,
          initialBinding: GlobalBinding(),
          builder: EasyLoading.init(
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);

              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}
