// import 'dart:convert' as json;
// import 'package:built_value/built_value.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/serializer.dart';
// import 'package:nigeriannews/serializers.dart';

// part 'articles.g.dart';

// abstract class Article implements Built<Article, ArticleBuilder> {
//   static Serializer<Article> get serializer => _$articleSerializer;
  
  
//   int get id;
//   String get title;
//   String get author;
//   String get description;
//   String get urlToImage;
//   DateTime get published;
//   String get content;
//   Article._();
//   factory Article([updates(ArticleBuilder b)]) = _$Article;
// }

// List<int> parseTopheadlines(String jsonStr) {
//   return [];
// }

// Article parseArticle(String jsonStr) {
//   final parsed = json.jsonDecode(jsonStr);
//   Article article = serializers.deserializeWith(Article.serializer, parsed);
//   return article;
// }

import 'package:json_annotation/json_annotation.dart';
part 'articles.g.dart';


@JsonSerializable()
class Article{
 final String name;
 final String title;
 final String author;
 final String description;
 final String url;
 final String urlToImage;
 final DateTime publishedAt;
 final String content;

  Article({
    this.name,
    this.title,
    this.author,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,

  });
  factory Article.fromJson(Map<String, dynamic> json)=>
  _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
