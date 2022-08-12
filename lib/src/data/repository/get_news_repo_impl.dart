import '../../domain/repository/get_news_repo.dart';
import '../../tools/connection_info.dart';
import '../remote/api/remote/get_news_remote_data_source.dart';
import '../remote/dto/news/news_model.dart';

class GetNewsRepositoryImpl implements GetNewsRepository {

  final GetNewsRemoteDataSource getNewsRemoteDataSource;
  final ConnectionInfo connectionInfo;

  GetNewsRepositoryImpl(
      this.getNewsRemoteDataSource,
      this.connectionInfo,
      );

  @override
  Future<NewsModelDto> getNews() async {
      final remoteNews = await getNewsRemoteDataSource.getNews();
      return remoteNews;
  }
}

