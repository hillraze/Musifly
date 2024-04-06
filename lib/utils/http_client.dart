import 'package:musifly/services/token_holder.dart';
import 'package:musifly/utils/env_secret.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart';

const _kDefaultConnectTimeout = Duration(seconds: 5);
const _kDefaultReceiveTimeout = Duration(seconds: 120);

/// Под капотом Dio.
///
/// Если у нас в будущем будет JWT - надо будет просто раскомментировать код
class MyHttpClient {
  late final Dio _dio;

  /*Future<bool>? _updating;
  final VoidCallback? onRefreshFmusiflylure;*/

  MyHttpClient(EnvSecret _apiUrl) {
    _dio = Dio(BaseOptions(
      baseUrl: _apiUrl.value,
      connectTimeout: _kDefaultConnectTimeout,
      receiveTimeout: _kDefaultReceiveTimeout,
    ));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _requestInterceptor,
        onError: _errorInterceptor,
      ),
    );
  }

  void _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasToken = Tokens.hasToken;
    if (hasToken) {
      options.headers['Authorization'] = 'Bearer ${Tokens.token}';
      options.headers['AppBuildNumber'] =
          (await PackageInfo.fromPlatform()).buildNumber;
    }

    return handler.next(options);
  }

  void _errorInterceptor(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final resp = err.response;
    if (resp == null) {
      return handler.reject(err);
    }

    if (resp.statusCode == 401) {
      await Tokens.removeToken();

      // Result<String>? res;
      // if (Platform.isIOS)
      //   res = await getIt<ISignInApi>().signInIos();
      // else
      //   res = await getIt<ISignInApi>().signInAndroid();

      //   if (res.success) {
      //     await Tokens.setToken(res.data);
      //     // retry failed request
      //     try {
      //       // Repeat the failed request
      //       final options = err.response?.requestOptions;
      //       if (options != null) {
      //         final res = await _dio.request<dynamic>(
      //           options.path,
      //           cancelToken: options.cancelToken,
      //           data: options.data,
      //           onReceiveProgress: options.onReceiveProgress,
      //           onSendProgress: options.onSendProgress,
      //           queryParameters: options.queryParameters,
      //           options: Options(
      //             method: options.method,
      //             headers: options.headers,
      //             contentType: options.contentType,
      //           ),
      //         );

      //         return handler.resolve(res);
      //       }
      //     } catch (e) {
      //       print("Error retrying failed request: $e");
      //     }
      //   } else
      //     print('Error refreshing token: ${res.error}');
    }

    handler.reject(err);
  }

  /*void _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!Tokens.hasTokens) {
      await _headers(options, token: null);
      return handler.next(options);
    }
    final tokens = Tokens.tokens;

    assert(() {
      final now = DateTime.now().millisecondsSinceEpoch;
      final exp = Jwt.getExpiryDate(tokens.accessToken)!.millisecondsSinceEpoch;
      if (kDebugMode) {
        print('Token will expire in ${(exp - now) ~/ 1000} seconds');
      }
      return true;
    }());

    if (!Jwt.isExpired(tokens.accessToken)) {
      await _headers(options, token: tokens.accessToken);
    } else {
      //this is only executed when token != null and expired

      bool? result;
      if (_updating == null) {
        _updating = _refreshToken(tokens.accessToken, tokens.refreshToken);
        result = await _updating!;
        _updating = null;
      }

      if (result ?? await _updating!) {
        await _headers(options, token: Tokens.tokens.accessToken);
      } else {
        return handler.reject(
          RefreshTokenError(
            requestOptions: options,
            response: Response(
              requestOptions: options,
              data: null,
              statusCode: -1,
            ),
          ),
          true,
        );
      }
    }

    handler.next(options);
  }

  Future<void> _headers(RequestOptions options, {String? token}) async {
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Content-type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Charset'] = 'utf-8';
  }

  Future<bool> _refreshToken(
    String accessToken,
    String refreshToken,
  ) async {
    try {
      final res = await Dio(BaseOptions(
        baseUrl: Environment.baseUrl(),
      )).post(
        '/auth/refresh',
        options: Options(headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          // 'Authorization': 'Bearer $accessToken',
        }),
        data: {
          'refreshToken': refreshToken,
        },
      );

      if (res.successful) {
        await Tokens.setTokens(TokenPair(
          accessToken: res.data['accessToken'],
          refreshToken: res.data['refreshToken'],
        ));
        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }*/

  Future<Response<T>> get<T>(
    String relativePath, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      relativePath,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> post<T>(
    String relativePath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.post(
      relativePath,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Response<T>> put<T>(
    String relativePath, {
    data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.put(
      relativePath,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Response<T>> delete<T>(
    String relativePath, {
    data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.delete(
      relativePath,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Response<T>> patch<T>(
    String relativePath, {
    data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.patch(
      relativePath,
      queryParameters: queryParameters,
      data: data,
    );
  }
}

/*class RefreshTokenError extends DioException {
  RefreshTokenError({
    required super.requestOptions,
    super.response,
  });

}*/

class NoInternetException extends DioException {
  NoInternetException({
    required RequestOptions requestOptions,
  }) : super(
          requestOptions: requestOptions,
        );
}

extension StatusCodeX on Response {
  bool get successful {
    final sc = statusCode;
    if (sc == null) return false;
    return sc >= 200 && sc < 300;
  }
}
