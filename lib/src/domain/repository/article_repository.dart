import '../../config/extensions/data_state.dart';
import '../../data/models/article.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<NewsModelDto>> getNewsArticles();

  Future <List<ArticleEntity>> getSavedArticles();

  Future <void> saveArticle(ArticleEntity article);

  Future <void> removeArticle(ArticleEntity article);
}

