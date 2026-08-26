import 'package:dio/dio.dart';
import 'package:whishing/core/constants/api_url.dart';
import 'package:whishing/core/constants/strings.dart';
import 'package:whishing/core/helper/shared_prefrences.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    if (dio == null) {
      Duration timeOut = const Duration(seconds: 8);
      dio = Dio();
      dio!.options.baseUrl = ApiUrls.baseUrl;
      dio!.options.receiveTimeout = timeOut;
      dio!.options.connectTimeout = timeOut;
      dio!.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
      _addinterceptors();
      return dio!;
    }
    return dio!;
  }

  static void _addinterceptors() {
    dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? tokn =
            SharedPreference.sharedString(StringsConstants.userToken);
        final bool requirestoken =
            options.extra[StringsConstants.requiresToken] ?? true;
        if (requirestoken) {
          if (tokn != null) {
            options.headers['Authorization'] = 'Bearer $tokn';
          }
        }
        return handler.next(options);
      },
    ));
  }
}
