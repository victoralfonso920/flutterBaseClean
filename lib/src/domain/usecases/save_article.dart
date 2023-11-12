import '../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void,ArticleEntity>{

  SaveArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.saveArticle(params!);
  }

}