import '../../dto/news/news_model.dart';
import '../../tools/api_const.dart';
import '../provider/ApiProvider.dart';
import '../constantes/keys_api.dart';

abstract class GetNewsRemoteDataSource {
  Future<NewsModelDto> getNews();
}

class GetNewsRemoteDataSourceImpl implements GetNewsRemoteDataSource {
  //INJECTION
  final ApiProvider apiProvider;

  GetNewsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<NewsModelDto> getNews() async {
    final Map<String, dynamic> params = {
      'language': 'en',
      'page': '1',
      'apiKey': newsApiKey
    };

    final Map<String, dynamic> jsonResponse =
    await apiProvider.getFromMap(suffixGetNews, params);
    final data = NewsModelDto.fromJson(jsonResponse);
    return data;
  }
}
