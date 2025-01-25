import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../helper/extensions.dart';

import '../shared_pref/shared_pref.dart';
import '../shared_pref/shared_pref_keys.dart';
import 'api_endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;
  static String? _authToken;

  static Future<Dio> getInstance() async {
    if (_dioInstance == null) {
      final dio = Dio();
      const timeout = Duration(seconds: 30);

      dio
        ..options.baseUrl = ApiEndpoints.baseUrl
        ..options.receiveTimeout = timeout
        ..options.connectTimeout = timeout
        ..options.sendTimeout = timeout;
      await setDefaultHeaders(dio);
      addInterceptors(dio);

      _dioInstance = dio;
    }
    return _dioInstance!;
  }

  static Future<void> setDefaultHeaders(Dio dio) async {
    _authToken = await SharedPref.getString(key: SharedPrefKeys.token);

    dio.options.headers = {
      'Accept': 'application/json',
      if (_authToken!.isNotNullOrEmpty()) 'Authorization': 'Bearer $_authToken',
    };
  }

  static void updateAuthToken(String token) {
    _authToken = token;
    if (_dioInstance != null) {
      _dioInstance!.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static void addInterceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authToken.isNotNullOrEmpty()) {
            options.headers['Authorization'] = 'Bearer $_authToken';
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}