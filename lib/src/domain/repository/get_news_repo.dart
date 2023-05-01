import '../../data/remote/dto/news_model.dart';

abstract class GetNewsRepository {
  Future<NewsModelDto> getNews();
}