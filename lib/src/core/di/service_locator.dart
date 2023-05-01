
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/remote/api/provider/api_provider.dart';
import '../../data/remote/api/remote/get_news_remote_data_source.dart';
import '../../data/remote/tools/api_const.dart';
import '../../data/repository/get_news_repo_impl.dart';
import '../../domain/repository/get_news_repo.dart';
import '../../domain/uses_cases/get_news_usecase.dart';
import '../../ui/features/news/news_viewmodel.dart';
import '../routes/navigation_service.dart';
import '../tools/connection_info.dart';


final GetIt sl = GetIt.instance;

Future<void> init() async {

  //Dio
  sl.registerLazySingleton(() => getDio());

  //! Features - ViewModels
  sl.registerLazySingleton(() => NewsViewModel(getNewsUseCases: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetNewsUseCases(sl()));

  // Repository
  sl.registerLazySingleton<GetNewsRepository>(
        () => GetNewsRepositoryImpl(sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<GetNewsRemoteDataSource>(
        () => GetNewsRemoteDataSourceImpl(apiProvider: sl()),
  );

  // ApiProvider
  sl.registerLazySingleton<ApiProvider>(
        () => ApiProvider(dio: sl()),
  );

  // ConnectionInfo
  sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));

  // InternetConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //navigation service
  sl.registerLazySingleton(() => NavigationService());
}

Dio getDio(){
  final dio = Dio(
    BaseOptions(
      validateStatus: (status) {
        return true;
      },
      followRedirects: false,
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  return dio;
}
