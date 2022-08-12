import 'package:bloc_test/bloc_test.dart';
import 'package:clean_core/src/data/remote/dto/news/article.dart';
import 'package:clean_core/src/data/remote/dto/news/news_model.dart';
import 'package:clean_core/src/domain/uses_cases/base/usecase.dart';
import 'package:clean_core/src/domain/uses_cases/get_news_usecase.dart';
import 'package:clean_core/src/ui/features/news/bloc/news_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_cubit_test.mocks.dart';

@GenerateMocks([GetNewsUseCases])
void main() {

  group('NewsCubitTest', () {

    final newsModel = NewsModelDto(status: "ok", code: "", articles: [
      Article(
          title: "title",
          description: "description",
          url: "url",
          urlToImage: "urlToImage",
      )
    ]);

    final mockUsesCase = MockGetNewsUseCases();


    blocTest<NewsCubit,NewsState>('News will be loaded correctly', build: () {
      when(mockUsesCase.call(NoParams())).thenAnswer((_) async => newsModel);
      return NewsCubit(getNewsUseCases:mockUsesCase);
    },
    act: (cubit) async => cubit.loadData(),
    expect: () => [
      NewsLoadingState(),
      NewsLoadCompleteState( newsModel.articles!)
    ]);
  });
}
