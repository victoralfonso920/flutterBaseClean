import 'package:clean_core/src/tools/extensions/log_extensions.dart';
import 'package:dio/dio.dart';
import '../../tools/custom_exception.dart';

class ApiProvider {
  //Inject Dependencies
  final Dio dio;

  ApiProvider({required this.dio});

  Future<Map<String, dynamic>> get(String endPoint) async {
    try {
      final Response response = await dio.get(
        endPoint,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> getFromMap(String endPoint,Map<String, dynamic> params) async {
    try {
      final Response response = await dio.get(
        endPoint,
        queryParameters: params,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    }
  }

  Future<Map<String, dynamic>> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final Response response = await dio.post(
        endPoint,
        data: body,
      );
      final Map<String, dynamic> responseData = classifyResponse(response);
      return responseData;
    } on DioError catch (err) {
      err.message.loge();
      throw FetchDataException("internetError");
    }
  }

  Map<String, dynamic> classifyResponse(Response response) {
    final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseData;
      case 400:
      case 401:
        throw UnauthorisedException(responseData["error"].toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}