import 'package:equatable/equatable.dart';

import '../../data/models/article.dart';

class HomeUiState extends Equatable {

  const HomeUiState({
    this.isLoading = false,
    required this.news,
    this.isError = false,
  });

  factory HomeUiState.createEmptyInstance() =>
      const HomeUiState(isLoading: true, isError: false, news: []);
  final bool isLoading;
  final List<ArticleModel>? news;
  final bool isError;

  HomeUiState copyWith({
    List<ArticleModel>? news,
    bool? isError,
    bool? isLoading
  }) => HomeUiState(
      news: news ?? this.news,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading
  );

  @override
  List<Object?> get props => [
        isLoading,
        news,
        isError,
      ];
}
