import 'package:flutter/cupertino.dart';

import 'article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModelDto {
 late final String? status;
 late final String? code;
 late final List<Article>? articles;

 NewsModelDto({this.status, this.code, this.articles});

 factory NewsModelDto.fromJson(Map<String, dynamic> json) => _$NewsModelDtoFromJson(json);
 Map<String, dynamic> toJson() => _$NewsModelDtoToJson(this);

}
