import '../../data/remote/dto/news/news_model.dart';

abstract class GetNewsRepository {
  Future<NewsModelDto> getNews();
}