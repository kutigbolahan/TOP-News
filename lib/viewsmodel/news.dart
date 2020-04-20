

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:nigeriannews/model/articles.dart';
import 'package:nigeriannews/model/serializers.dart';
import 'dart:convert';

// enum ArticlesType{
//     sportsNews,
//     healthNews,
//     entertainNews,
//     techNews,
//   }

 class HttpService with ChangeNotifier {


//   Map<int, Article> _cachedArticles;

//   bool _isLoading = false;
//   bool get isLoading=> _isLoading;

//   List<Article>_sportsArticle =[];
//   UnmodifiableListView<Article> get sportsArticle=> UnmodifiableListView(_sportsArticle);
//   List<Article>_healthArticle =[];
//   UnmodifiableListView<Article> get healthArticle=> UnmodifiableListView(_healthArticle);
//   List<Article>_entertainArticle =[];
//   UnmodifiableListView<Article> get entertainArticle=> UnmodifiableListView(_entertainArticle);
//   List<Article>_techArticle =[];
//   UnmodifiableListView<Article> get techArticle=> UnmodifiableListView(_techArticle);
  
//   List<Article> _articles = [];
//   UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

//   ArticlesType _articlesType;
//   ArticlesType get articleType => _articlesType;

//   HttpService(): _cachedArticles = Map(){
//     getArticlesByType(ArticlesType.sportsNews);
//   }

//   Future<void> getArticlesByType (ArticlesType type) async{
//     _isLoading = true;
//     notifyListeners();
//     final ids = await _getIds(type);
//     _articles = await _updateArticles(ids);

//     switch(type){
//       case ArticlesType.sportsNews:
//       _sportsArticle =_articles;
//       break;
//       case ArticlesType.healthNews:
//        _healthArticle =_articles;
//         break;
//       case ArticlesType.entertainNews:
//         _entertainArticle =_articles;
//         break;
//       case ArticlesType.techNews:
//         _techArticle =_articles;
//         break;
//     }
//     _isLoading = false;
//     notifyListeners();
//   }

  List<News> news =[];
   UnmodifiableListView<News> get getnews => UnmodifiableListView(news);
  List<Article> article =[];
   UnmodifiableListView<Article> get getarticle => UnmodifiableListView(article);
  

  
  Future<News> getSportsNews() async {
  
   
  // try {
      final String sportsurl =
        'http://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=7b2380f2052e4b2c9223e21021914f2e';
     final res = await http.get(sportsurl);

    News sportsnews = standardSerializers.deserializeWith(
        News.serializer, jsonDecode(res.body));
   notifyListeners();
    print("SportsNews total" + sportsnews.totalResults.toString());
     return sportsnews;
     
  //  } catch (e) {
  //    print(e);
  //    return e.message;
  //  }
    
  }

  Future<News> getHealthNews() async {
  // try {
      final String healthurl =
        'http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=7b2380f2052e4b2c9223e21021914f2e';
    final res = await http.get(healthurl);

    News healthnews = standardSerializers.deserializeWith(
        News.serializer, jsonDecode(res.body));
   notifyListeners();
    print("HealthNews total" + healthnews.totalResults.toString());
     return healthnews;
  //  } catch (e) {
  //    print(e);
  //    return e.message;
     
  //  }
   
  }

//  Future<News> getEntertainmentNews()async{
//    final String entertainUrl = 'http://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=7b2380f2052e4b2c9223e21021914f2e';
//    final res =await http.get(entertainUrl);

//    News entertainnews = standardSerializers.deserializeWith(News.serializer, jsonDecode(res.body));
//    notifyListeners();
//    print("entertainNews total" + entertainnews.totalResults.toString());
//    return entertainnews;
//   }
  
//    Future<News> getTechnologyNews()async{
//    final String techUrl = 'http://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=7b2380f2052e4b2c9223e21021914f2e';
//    final res =await http.get(techUrl);

//    News technologynews = standardSerializers.deserializeWith(News.serializer, jsonDecode(res.body));
// notifyListeners();
//    print("technologynews total" + technologynews.totalResults.toString());
//    return technologynews;
//   }
 
}
