import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/configs/themes/app_colors.dart';
import 'package:weather_app/configs/themes/app_text_styles.dart';
import 'package:weather_app/constants/dimen_consts.dart';
import 'package:weather_app/modules/home/controllers/home_controller.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weather = HomeController.to.weather();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          weather.name.toString(),
          style: AppTextStyles.f40WhiteW700,
        ),
        SizedBox(height: DimenConsts.pixel46.h),
        Container(
          width: DimenConsts.pixel240.w,
          height: DimenConsts.pixel240.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor.withOpacity(0.5),
          ),
          child: Column(
            children: [
              SizedBox(height: DimenConsts.pixel20.h),
              CachedNetworkImage(
                imageUrl:
                    'https://openweathermap.org/img/wn/${weather.weather![0].icon}@2x.png',
                fit: BoxFit.cover,
                 width: DimenConsts.pixel145.w,
                height: DimenConsts.pixel105.h,
              ),
              SizedBox(height: DimenConsts.pixel4.h),
              Text(
                '${weather.main?.temp}°C',
                style: AppTextStyles.f44BlackW300,
              )
            ],
          ),
        ),
        SizedBox(height: DimenConsts.pixel42.h),
        Text(
          weather.weather![0].description.toString(),
          style: AppTextStyles.f20WhiteW700,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: Text(
                "Wind speed",
                style: AppTextStyles.f14WhiteW700,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "Humidity",
                style: AppTextStyles.f14WhiteW700,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "Visibility",
                style: AppTextStyles.f14WhiteW700,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "Air pressure",
                style: AppTextStyles.f14WhiteW700,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(height: DimenConsts.pixel8.h),
        Row(
          children: [
            Expanded(
              child: Text(
                weather.wind!.speed.toString(),
                style: AppTextStyles.f14WhiteW400,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                weather.main!.humidity.toString(),
                style: AppTextStyles.f14WhiteW400,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                weather.visibility.toString(),
                style: AppTextStyles.f14WhiteW400,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                weather.main!.pressure.toString(),
                style: AppTextStyles.f14WhiteW400,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(height: DimenConsts.pixel100.h)
      ],
    );
  }
}
