import '../../core/extensions/base/usecase.dart';
import '../../data/remote/dto/news_model.dart';
import '../repository/get_news_repo.dart';

class GetNewsUseCases extends UseCase<NewsModelDto, NoParams> {
  final GetNewsRepository _repository;

  GetNewsUseCases(this._repository);

  @override
  Future<NewsModelDto> call(NoParams params) async {
    return await _repository.getNews();
  }
}