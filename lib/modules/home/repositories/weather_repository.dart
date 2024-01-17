import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/constants/api_consts.dart';
import 'package:weather_app/modules/home/models/weather_model.dart';
import 'package:weather_app/utils/services/dio_service.dart';

class WeatherRepository {
  WeatherRepository._();

  static Future<WeatherModel> getWeather({
    required double lat,
    required double long,
  }) async {
    try {
      final Dio dio = DioService.dioCall();

      var response = await dio.get(
        ApiConstants.getWeather(),
        queryParameters: {
          'lat': lat,
          'lon': long,
          'appid': '246870ca0491e4f355fa3c139dd60029',
          'lang': 'ID',
          'units': 'metric',
        },
      );

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      var response = jsonDecode(e.response.toString());

      if (e.response != null) {
        return WeatherModel(
          message: response,
        );
      } else {
        return WeatherModel(
          message: 'Something went wrong!',
        );
      }
    }
  }
}
