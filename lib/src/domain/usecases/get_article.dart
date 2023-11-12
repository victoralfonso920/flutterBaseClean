
import '../../config/extensions/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../../data/models/article.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<NewsModelDto>,void>{

  GetArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<DataState<NewsModelDto>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }

}