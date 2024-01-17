import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:weather_app/configs/themes/app_colors.dart';
import 'package:weather_app/constants/dimen_consts.dart';
import 'package:weather_app/modules/home/views/components/home_component.dart';

import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: RefreshIndicator(
        onRefresh: () async => await controller.onRefresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: DimenConsts.pixel8.w),
            width: double.infinity,
            height: Get.height,
            child: Obx(
              () {
                if (controller.weather().id != null) {
                  return const HomeComponent();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
