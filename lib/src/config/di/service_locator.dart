import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/data_sources/local/dao/app_database.dart';
import '../../data/data_sources/remote/news_api_service.dart';
import '../../data/repository/article_repository_impl.dart';
import '../../domain/repository/article_repository.dart';
import '../../domain/usecases/get_article.dart';
import '../../domain/usecases/get_saved_article.dart';
import '../../domain/usecases/remove_article.dart';
import '../../domain/usecases/save_article.dart';
import '../../ui/features/cubit/local/local_article_cubit.dart';
import '../../ui/features/cubit/remote/remote_article_cubit.dart';
import '../routes/navigation_service.dart';
import '../tools/connection_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //navigation service
  sl.registerLazySingleton(() => NavigationService());

  // Dio
  sl.registerLazySingleton<Dio>(() => getDio());

  sl.registerLazySingleton<NewsApiService>(() => NewsApiService(sl()));

  sl.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(sl(), sl()));


  //UseCases
  sl.registerLazySingleton<GetArticleUseCase>(() => GetArticleUseCase(sl()));

  sl.registerLazySingleton<GetSavedArticleUseCase>(
      () => GetSavedArticleUseCase(sl()));

  sl.registerLazySingleton<SaveArticleUseCase>(() => SaveArticleUseCase(sl()));

  sl.registerLazySingleton<RemoveArticleUseCase>(
      () => RemoveArticleUseCase(sl()));

  //Blocs

  sl.registerFactory<RemoteArticleCubit>(
      () => RemoteArticleCubit(getArticleUseCase: sl()));

  sl.registerFactory<LocalArticleCubit>(
      () => LocalArticleCubit(removeArticleUseCase: sl(), getSavedArticleUseCase: sl(), saveArticleUseCase: sl()));

  // ConnectionInfo
  sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));

  // InternetConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());

}

Dio getDio() {
  final dio = Dio(
    BaseOptions(
      validateStatus: (status) {
        return true;
      },
      followRedirects: false,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  return dio;
}
