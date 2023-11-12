import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/extensions/data_state.dart';
import '../../../../domain/entities/article.dart';
import '../../../../domain/model/ui/ArticleUiState.dart';
import '../../../../domain/usecases/get_article.dart';
import '../../../../domain/usecases/get_saved_article.dart';
import '../../../../domain/usecases/remove_article.dart';
import '../../../../domain/usecases/save_article.dart';

class LocalArticleCubit extends Cubit<ArticleUiState> {
  LocalArticleCubit(
      {required this.getSavedArticleUseCase,
      required this.saveArticleUseCase,
      required this.removeArticleUseCase})
      : super(ArticleUiState.createEmptyInstance());

  final GetSavedArticleUseCase getSavedArticleUseCase;
  final SaveArticleUseCase saveArticleUseCase;
  final RemoveArticleUseCase removeArticleUseCase;

  Future<void> onGetSavedArticles() async {
    loadingState();
    final articles = await getSavedArticleUseCase();
    emit(state.copyWith(data: articles, success: true, isLoading: false));
  }

  Future<void> onRemoveArticle(ArticleEntity article) async {
    loadingState();
    await removeArticleUseCase(params: article);
    final articles = await getSavedArticleUseCase();
    emit(state.copyWith(data: articles, success: true, isLoading: false));
  }

  Future<void> onSaveArticle(ArticleEntity article) async {
    loadingState();
    await saveArticleUseCase(params: article);
    final articles = await getSavedArticleUseCase();
    emit(state.copyWith(data: articles, isLoading: false, success: true));
  }

  Future<void> loadingState() async {
    emit(state.copyWith(isLoading: true));
  }
}
