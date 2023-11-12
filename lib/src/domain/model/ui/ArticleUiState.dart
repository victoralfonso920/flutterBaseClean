import '../../entities/article.dart';

class ArticleUiState {
  const ArticleUiState({
    this.isLoading,
    this.data,
    this.success,
    this.isError,
    this.messageError
  });

  factory ArticleUiState.createEmptyInstance() => ArticleUiState(
    isLoading: false,
    data: [],
    success: false,
    isError: false,
    messageError: '',
  );

  final bool? isLoading;
  final List<ArticleEntity>? data;
  final bool? success;
  final bool? isError;
  final String? messageError;

  ArticleUiState copyWith(
      {bool? isLoading,
      List<ArticleEntity>? data,
      bool? success,
      bool? isError,
        String? messageError
      }) {
    return ArticleUiState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
        success: success ?? this.success,
        isError: isError ?? this.isError,
        messageError: messageError ?? this.messageError
    );
  }
}
