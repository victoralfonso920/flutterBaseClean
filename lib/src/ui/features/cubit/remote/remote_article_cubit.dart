import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/extensions/data_state.dart';
import '../../../../domain/model/ui/ArticleUiState.dart';
import '../../../../domain/usecases/get_article.dart';

class RemoteArticleCubit extends Cubit<ArticleUiState> {
  RemoteArticleCubit({required this.getArticleUseCase})
      : super(ArticleUiState.createEmptyInstance());
  final GetArticleUseCase getArticleUseCase;

  Future<void> getArticles() async {
    loadingState();
    final result = await getArticleUseCase();
    if (result is DataSuccess && result.data?.articles.isNotEmpty == true) {
      emit(state.copyWith(
          isLoading: false, success: true, data: result.data?.articles));
    }

    if (result is DataFailed) {
      emit(state.copyWith(
          isLoading: false,
          success: false,
          isError: true,
          messageError: result.error?.message));
    }
  }

  Future<void> loadingState() async {
    emit(state.copyWith(isLoading: true));
  }
}
