import 'package:floor/floor.dart';

import '../../config/extensions/log_extensions.dart';
import '../../core/constants/constants.dart';
import '../../domain/entities/article.dart';


class NewsModelDto {
  NewsModelDto({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModelDto.fromJson(Map<String, dynamic> json) => NewsModelDto(
    status: json['status'],
    totalResults: json['totalResults'],
    articles: List<ArticleModel>.from(json['articles'].map((x) => ArticleModel.fromJson(x))),
  );

  String status;
  dynamic totalResults;
  List<ArticleModel> articles;

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'articles': List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}



@Entity(tableName: 'article',primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int ? id,
    String ? author,
    String ? title,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,
  }): super(
    id: id,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content
    );
  }

  factory ArticleModel.fromJson(Map<String,dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != '' ? map['urlToImage'] : kDefaultImage,
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}