import 'package:musifly/core/resources/result.dart';
import 'package:musifly/utils/http_client.dart';
import 'package:dio/dio.dart';

/// Base class for objects that communicate with remote data sources.
abstract class Api {
  const Api();
}

/// Если надо будет работать с JWT - раскомментируй RefreshTokenError
abstract class RestfulApi extends Api {
  const RestfulApi();

  Future<Result<T>> run<T>(Future<Result<T>> Function() fn) async {
    try {
      return await fn.call();
    } on NoInternetException catch (_) {
      return Result.failure(
        'This app requires Internet connection to work properly!',
      );
    } on DioException catch (e) {
      // AiAnalytics.instance.logEvent(ApiExceptionEvent(props: {
      //   'request': e.requestOptions.path,
      //   'status code': e.response?.statusCode,
      //   'message': e.response?.data['message'],
      // }));

      try {
        final msg = e.response?.data['message'] ??
            'Oops! There\'s been an error on our end! Try again!';
        return Result.failure(msg);
      } catch (_) {
        return Result.failure('Something went wrong! Try again!');
      }
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
