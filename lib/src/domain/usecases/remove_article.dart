import '../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void,ArticleEntity>{

  RemoveArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.removeArticle(params!);
  }

}