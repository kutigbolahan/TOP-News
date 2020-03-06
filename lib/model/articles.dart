
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';


part 'articles.g.dart';

// // abstract class Article implements Built<Article, ArticleBuilder> {
// //   static Serializer<Article> get serializer => _$articleSerializer;
  
  
// //   int get id;
// //   String get title;
// //   String get author;
// //   String get description;
// //   String get urlToImage;
// //   DateTime get published;
// //   String get content;
// //   Article._();
// //   factory Article([updates(ArticleBuilder b)]) = _$Article;
// // }

// // List<int> parseTopheadlines(String jsonStr) {
// //   return [];
// // }

// // Article parseArticle(String jsonStr) {
// //   final parsed = json.jsonDecode(jsonStr);
// //   Article article = serializers.deserializeWith(Article.serializer, parsed);
// //   return article;
// // }

// import 'package:json_annotation/json_annotation.dart';
// part 'articles.g.dart';


// @JsonSerializable()
// class Article{
//  final String name;
//  final String title;
//  final String author;
//  final String description;
//  final String url;
//  final String urlToImage;
//  final DateTime publishedAt;
//  final String content;

//   Article({
//     this.name,
//     this.title,
//     this.author,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,

//   });
//   factory Article.fromJson(Map<String, dynamic> json)=>
    
  
//   _$ArticleFromJson(json);
//   Map<String, dynamic> toJson() => _$ArticleToJson(this);
// }
// // factory Chat.fromJson(Map<String, dynamic> json) {
// //     json["members"] = (json['members'] as List)
// //           ?.map((e) =>
// //               e == null ? null : Map<String, dynamic>.from(e))
// //           ?.toList();
// //      return _$ChatFromJson(json);  
// //   }

abstract class News implements Built<News, NewsBuilder> {
  // Fields
  String get status;
  int get totalResults;
  BuiltList<Article>get articles;

  News._();

  factory News([void Function(NewsBuilder) updates]) = _$News;

  // String toJson() {
  //   return json.encode(serializers.serializeWith(News.serializer, this));
  // }

  // static News fromJson(String jsonString) {
  //   return serializers.deserializeWith(News.serializer, json.decode(jsonString));
  // }

  static Serializer<News> get serializer => _$newsSerializer;
}

abstract class Source implements Built<Source, SourceBuilder> {
  // Fields
  String get id;
  String get name;

  Source._();

  factory Source([void Function(SourceBuilder) updates]) = _$Source;

  // String toJson() {
  //   return json.encode(serializers.serializeWith(Source.serializer, this));
  // }

  // static Source fromJson(String jsonString) {
  //   return serializers.deserializeWith(Source.serializer, json.decode(jsonString));
  // }

  static Serializer<Source> get serializer => _$sourceSerializer;
}

abstract class Article implements Built<Article, ArticleBuilder> {
 
  // Fields
  @nullable
  String get author;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  String get url;
  @nullable
  String get urlToImage;
  
  //int get publishedAt;
  @nullable
  String get contents;

  Article._();

  factory Article([void Function(ArticleBuilder) updates]) = _$Article;

  // String toJson() {
  //   return json.encode(serializers.serializeWith(Article.serializer, this));
  // }

  // static Article fromJson(String jsonString) {
  //   return serializers.deserializeWith(Article.serializer, json.decode(jsonString));
  // }

  static Serializer<Article> get serializer => _$articleSerializer;
}