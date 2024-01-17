import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/configs/themes/app_colors.dart';
import 'package:weather_app/configs/themes/app_text_styles.dart';
import 'package:weather_app/constants/dimen_consts.dart';
import 'package:weather_app/modules/no_connection/controllers/no_connection_controller.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Container(
            width: 450,
            height: double.infinity,
            padding: EdgeInsets.zero,
            child: Scaffold(
              appBar: null,
              backgroundColor: AppColors.primaryColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Connection',
                        style: AppTextStyles.f20WhiteW700,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: DimenConsts.pixel24.h),
                      ElevatedButton(
                        onPressed: () =>
                            NoConnectionController.to.checkConnection(context),
                        child: Text(
                          'Check Connection',
                          style: AppTextStyles.f14WhiteW700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
