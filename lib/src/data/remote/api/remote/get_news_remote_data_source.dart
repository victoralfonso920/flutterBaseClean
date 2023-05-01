import '../../dto/news_model.dart';
import '../../tools/api_const.dart';
import '../keys_api/keys_api.dart';
import '../provider/api_provider.dart';

abstract class GetNewsRemoteDataSource {
  Future<NewsModelDto> getNews();
}

class GetNewsRemoteDataSourceImpl implements GetNewsRemoteDataSource {

  final ApiProvider apiProvider;
  GetNewsRemoteDataSourceImpl({required this.apiProvider});


  @override
  Future<NewsModelDto> getNews() async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.get("$suffixGetNews$newsApiKey");
    final data = NewsModelDto.fromJson(jsonResponse);
    return data;
  }
}