import 'package:dio/dio.dart';

abstract class IDioServices {
  Dio dio();
}

class DioServices implements IDioServices {
  @override
  Dio dio() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000/search?query=',
      ),
    );
  }
}
