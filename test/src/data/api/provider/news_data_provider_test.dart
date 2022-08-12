import 'dart:convert';
import 'package:clean_core/src/data/remote/api/constantes/keys_api.dart';
import 'package:clean_core/src/data/remote/dto/news/news_model.dart';
import 'package:clean_core/src/data/remote/tools/api_const.dart';
import 'package:clean_core/src/data/remote/tools/custom_exception.dart';
import 'package:clean_core/src/di/service_locator.dart';
import 'package:clean_core/src/tools/utils_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const successMessage = {'message': 'Success'};
const errorMessage = {'message': 'error'};
const testPath = 'test';
const testData = {'data': 'sample data'};
const header = {'Content-Type': 'application/json'};

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;
  setUp(() {
    dio = getDio(baseUrl);
    dioAdapter = DioAdapter(dio: dio);
  });

  final Map<String, dynamic> params = {
    'language': 'en',
    'page': '1',
    'apiKey': newsApiKey
  };

  test("should return 200", () async {
    final res = await readJson("test/data_mock/data_new_articles.json");
    dioAdapter.onGet(suffixGetNews, (server) {
      server.reply(200, res);
    }, queryParameters: params);
    final response = jsonDecode(res);
    expect(response["status"], "ok");
  });

  test('Api key missing exception is thrown correctly', () async {
    final res = await readJson("test/data_mock/api_key_missing.json");
    dioAdapter.onGet(suffixGetNews, (server) {
      server.reply(200, res);
    }, queryParameters: params);
    final response = jsonDecode(res);
    expect(response["code"], "apiKeyMissing");
  });

  test('Invalid Api key exception is thrown correctly', () async {
    final res = await readJson("test/data_mock/api_key_invalid.json");
    dioAdapter.onGet(suffixGetNews, (server) {
      server.reply(200, res);
    }, queryParameters: params);
    final response = jsonDecode(res);
    expect(response["code"], "apiKeyInvalid");
  });
}
