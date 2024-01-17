import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/constants/api_consts.dart';

class DioService {
  DioService._();

  static final DioService dioService = DioService._();

  factory DioService() {
    return dioService;
  }

  static const int timeoutInMiliSeconds = 30000;

  static Dio dioCall({
    int timeout = timeoutInMiliSeconds,
    String? token,
    String? authorization,
  }) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: ApiConstants.api,
        connectTimeout: Duration(milliseconds: timeout),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(_authInterceptor());

    return dio;
  }

  static Interceptor _authInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: (reqOptions, handler) {
        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');
        log('${reqOptions.data}', name: 'DATA');

        return handler.next(reqOptions);
      },
      onError: (error, handler) async {
        log(error.message.toString(), name: 'ERROR MESSAGE');
        log('${error.response}', name: 'RESPONSE');
        log('${error.requestOptions.uri}', name: 'ERROR FROM URL');

        return handler.next(error); //return non 401 error
      },
      onResponse: (response, handler) async {
        log('${response.requestOptions.uri}', name: 'RESPONSE FROM URL');
        log('${response.data}', name: 'RESPONSE');

        return handler.resolve(response);
      },
    );
  }
}
