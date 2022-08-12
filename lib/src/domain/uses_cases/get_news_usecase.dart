import '../../data/remote/dto/news/news_model.dart';
import '../repository/get_news_repo.dart';
import 'base/usecase.dart';

class GetNewsUseCases extends UseCase<NewsModelDto, NoParams> {
  final GetNewsRepository repository;

  GetNewsUseCases(this.repository);

  @override
  Future<NewsModelDto> call(NoParams params) async {
    return await repository.getNews();
  }
}