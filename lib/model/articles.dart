
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';


part 'articles.g.dart';




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