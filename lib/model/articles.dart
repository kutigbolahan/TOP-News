
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';


part 'articles.g.dart';




abstract class News implements Built<News, NewsBuilder> {
  String get status;
  int get totalResults;
  BuiltList<Article>get articles;
  News._();
  factory News([void Function(NewsBuilder) updates]) = _$News;
  static Serializer<News> get serializer => _$newsSerializer;
}
abstract class Source implements Built<Source, SourceBuilder> {
  String get id;
  String get name;
  Source._();
  factory Source([void Function(SourceBuilder) updates]) = _$Source;
  static Serializer<Source> get serializer => _$sourceSerializer;
}
abstract class Article implements Built<Article, ArticleBuilder> {
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
  @nullable
  String get contents;
  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
  static Serializer<Article> get serializer => _$articleSerializer;
}
