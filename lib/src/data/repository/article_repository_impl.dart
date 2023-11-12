import 'dart:io';

import 'package:dio/dio.dart';
import '../../config/extensions/data_state.dart';
import '../../config/extensions/log_extensions.dart';
import '../../core/constants/constants.dart';
import '../../domain/entities/article.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/local/dao/app_database.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  @override
  Future<DataState<NewsModelDto>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
