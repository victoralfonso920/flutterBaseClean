import 'package:clean_core/src/ui/features/news/news_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:network_logger/network_logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/remote/api/provider/ApiProvider.dart';
import '../data/remote/api/remote/get_news_remote_data_source.dart';
import '../data/remote/tools/api_const.dart';
import '../data/repository/get_news_repo_impl.dart';
import '../domain/repository/get_news_repo.dart';
import '../domain/uses_cases/get_news_usecase.dart';
import '../tools/connection_info.dart';
import '../tools/responsive.dart';
import '../ui/features/news/bloc/news_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Features - ViewModels
  sl.registerLazySingleton(() => NewsViewModel(getNewsUseCases: sl()));
  sl.registerLazySingleton(() => NewsCubit(getNewsUseCases: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetNewsUseCases(sl()));

  // Repository
  sl.registerLazySingleton<GetNewsRepository>(
    () => GetNewsRepositoryImpl(sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<GetNewsRemoteDataSource>(
    () => GetNewsRemoteDataSourceImpl(
        apiProvider: sl.get<ApiProvider>(param1: baseUrl)),
  );

  // ConnectionInfo
  sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));

  // InternetConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //Responsive
  sl.registerFactoryParam<Responsive, BuildContext, void>(
      (context, _) => Responsive(context));

  //ApiProvider
  sl.registerFactoryParam<ApiProvider, String, void>(
      (url, _) => ApiProvider(dio: getDio(url)));
}

Dio getDio(String url) {
  final dio = Dio(
    getBaseOptions(url),
  );
  if (kDebugMode) {
    dio.interceptors.add(getLogger());
    dio.interceptors.add(DioNetworkLogger());
  }
  return dio;
}

BaseOptions getBaseOptions(String url) => BaseOptions(
      validateStatus: (status) {
        return true;
      },
      followRedirects: false,
      baseUrl: url,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );

PrettyDioLogger getLogger() => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    );
