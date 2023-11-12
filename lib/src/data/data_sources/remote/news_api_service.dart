
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/constants/constants.dart';
import '../../models/article.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl:newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<NewsModelDto>> getNewsArticles({
    @Query('country') String? country,
    @Query('category') String? category,
    @Query('apiKey') String? apiKey,
  });
}