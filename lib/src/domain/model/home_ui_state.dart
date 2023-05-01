import 'package:equatable/equatable.dart';

import '../../data/remote/dto/news_model.dart';

class HomeUiState extends Equatable {
  final bool isLoading;
  final List<Article>? news;
  final bool isError;

  const HomeUiState({
    this.isLoading = false,
    required this.news,
    this.isError = false,
  });

  copyWith({
    List<Article>? news,
    bool? isError,
    bool? isLoading
  }) => HomeUiState(
      news: news ?? this.news,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading
  );

  factory HomeUiState.createEmptyInstance() =>
      const HomeUiState(isLoading: true, isError: false, news: []);

  @override
  List<Object?> get props => [
        isLoading,
        news,
        isError,
      ];
}
