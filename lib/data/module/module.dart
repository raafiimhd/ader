import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dioInstance => Dio(BaseOptions(
        // baseUrl: ApiEndpoint.baseUrl,
        headers: {
          'Accept': 'application/json',
        },
      ));
}
