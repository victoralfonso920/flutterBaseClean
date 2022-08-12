// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModelDto _$NewsModelDtoFromJson(Map<String, dynamic> json) => NewsModelDto(
      status: json['status'] as String?,
      code: json['code'] as String?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelDtoToJson(NewsModelDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'articles': instance.articles,
    };
