import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/extensions/base/usecase.dart';
import '../../../data/remote/dto/news_model.dart';
import '../../../domain/model/home_ui_state.dart';
import '../../../domain/uses_cases/get_news_usecase.dart';

class NewsViewModel extends Cubit<HomeUiState> {
  final GetNewsUseCases getNewsUseCases;

  NewsViewModel({required this.getNewsUseCases}) : super(HomeUiState.createEmptyInstance());

  HomeUiState homeModelUi = HomeUiState.createEmptyInstance();


  void loadData() async {
    emit(homeModelUi.copyWith(isLoading: true));
    try {
      Future.delayed(const Duration(seconds: 3), () async {
        final news = await getNewsUseCases.call(NoParams());
        emit(homeModelUi.copyWith(news:news.articles, isLoading: false));
      });

    } catch (e) {
      emit(homeModelUi.copyWith(isError: true, isLoading: false,news: []));
    }
  }

  List<Article> getFakeArticle(){
    return [
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content"),
      Article(source: Source(id: 'cddsd', name: 'dsdsds'), author: "dsadasSAS", title: "DSDSDS", description: "description", url: "url", urlToImage: "", publishedAt: DateTime.now(), content: "content")

    ];
  }



}
