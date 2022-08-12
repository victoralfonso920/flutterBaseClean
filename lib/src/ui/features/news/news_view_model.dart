import 'package:clean_core/src/data/remote/dto/news/news_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/remote/tools/response_classify.dart';
import '../../../domain/uses_cases/base/usecase.dart';
import '../../../domain/uses_cases/get_news_usecase.dart';



class NewsViewModel extends ChangeNotifier{

  //Inject Dependencies
  final GetNewsUseCases getNewsUseCases;
  NewsViewModel({required this.getNewsUseCases});

 //States
  ResponseClassify<NewsModelDto?> _newsList = ResponseClassify.loading();
  ResponseClassify<NewsModelDto?> get newsList => _newsList;

  //Functions
  void loadData() async {
    _newsList = ResponseClassify.loading();
    notify();
    try {
      _newsList = ResponseClassify.completed(await getNewsUseCases.call(NoParams()));
    } catch (e) {
      _newsList = ResponseClassify.error(e.toString());
    }
    notify();
  }

  void notify(){
    notifyListeners();
  }
}

