import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T data;
  final DioError error;

   const DataState({required this.data,   required this.error});
}

class DataSuccess<T> extends DataState<T> {
   DataSuccess(T data, DioError error) : super(data: data, error: error);
}

class DataFailed<T> extends DataState<T> {
   DataFailed(T data, DioError error) : super(data: data, error: error);
}