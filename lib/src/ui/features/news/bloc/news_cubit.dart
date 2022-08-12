import 'package:bloc/bloc.dart';
import 'package:clean_core/src/data/remote/dto/news/article.dart';
import 'package:clean_core/src/domain/uses_cases/get_news_usecase.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/uses_cases/base/usecase.dart';

class NewsCubit extends Cubit<NewsState> {
  //Inject Dependencies
  final GetNewsUseCases getNewsUseCases;
  NewsCubit({required this.getNewsUseCases}): super(NewsInitialState());

  //Functions
  void loadData() async {
    emit(NewsLoadingState());
    try {
      final news = await getNewsUseCases.call(NoParams());
      emit(NewsLoadCompleteState(news.articles!));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }
}

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadCompleteState extends NewsState {
  final List<Article> news;
  NewsLoadCompleteState(this.news);

  @override
  List<Object> get props => [news];
}

class NewsErrorState extends NewsState {
  final String message;
  NewsErrorState(this.message);
  @override
  List<Object> get props => [message];
}
