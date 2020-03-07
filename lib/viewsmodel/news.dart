

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:nigeriannews/model/articles.dart';
import 'package:nigeriannews/model/serializers.dart';
import 'dart:convert';

// class News {
//   List<Article> news = [];

//   //String api_key = '7b2380f2052e4b2c9223e21021914f2e';
//   Future<void> getNews() async {
//     String url ='https://newsapi.org/v2/top-headlines?country=ng&apiKey=7b2380f2052e4b2c9223e21021914f2e';
//     var response = await http.get(url);

//    var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == 'ok') {

//       jsonData['articles'].forEach((element) {
//         if(element['urlToImage'] !=null && element['author'] !=null){
//            Article article = Article(
//              name: element['name'],
//             author: element['author'],
//             title: element['title'],
//             description: element['description'],
//             url: element['url'],
//             urlToImage: element['urlToImage'],
//             publishedAt: DateTime.parse(element['publishedAt']),
//             content: element['content']);
//         news.add(article);
//         }

//       }
//     );
//    }
//   }
//  }

// enum NewsArticleType {
//   SportArticles,
//   HealthArticles,
// }

// class AppState with ChangeNotifier {
//   List _sportArticlesauthor = [];
//   List _healthArticlesauthor = [];

//   List<News> _sportArticles = [];
//   List<News> _healthArticles = [];

//   var _cache = HashMap<String, News>();

//   final String sportsurl =
//       'http://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=7b2380f2052e4b2c9223e21021914f2e';
//   final String healthurl =
//       'http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=7b2380f2052e4b2c9223e21021914f2e';

//   bool _sportsIsLoading = true;
//   bool _healthIsLoading = true;

//   NewsArticleType _newsArticleType = NewsArticleType.SportArticles;

//   AppState._(){
//     _updateNewsArticle(_newsArticleType);
//   }

//   factory AppState() {
//     return AppState._();
//   }

//   List<News>get neews{
//     if (_newsArticleType == NewsArticleType.SportArticles) {
//       // return ;

//     }
//   }

//   //function to get author of stories based on newsarticletype

//   Future<List> initNewsArticles(NewsArticleType type) async {
//     String frontUrl =
//         type == NewsArticleType.SportArticles ? 'sports' : 'health';
//     String url = '$sportsurl$frontUrl';
//     final res = await http.get(url);

//     if (res.statusCode != 200) {
//       throw 'Couldnt fetch news articles';
//     }
//     return jsonDecode(res.body);
//   }
//   // Future<News> sportsinitNewsArticles(NewsArticleType type) async{
//   //   String frontUrl = type == NewsArticleType.SportArticles ?'sports': 'health';
//   //   String url = '$sportsurl$frontUrl';
//   //   final res = await http.get(url);

//   //   if (res.statusCode != 200 ) {
//   //     throw'Couldnt fetch news articles';
//   //   }
//   //     News news = standardSerializers.deserializeWith(
//   //       News.serializer, jsonDecode(res.body));

//   //   return news;
//   // }

//   Future<News> _getNewsArticles(String author) async {
//     if (!_cache.containsKey(author)) {
//       final String healthurl =
//           'http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=7b2380f2052e4b2c9223e21021914f2e';
//       final res = await http.get(healthurl);
//       if (res.statusCode != 200) {
//         throw 'Couldnt fetch news articles';
//       } else {
//         _cache[author] = jsonDecode(res.body);
//       }
//     }
//     return _cache[author];
//   }

//   // Future<News> healthinitNewsArticles(NewsArticleType type) async{

//   // String url = '$healthurl';
//   //   final res = await http.get(url);

//   //   if (res.statusCode != 200 ) {
//   //     throw'Couldnt fetch news articles';
//   //   }
//   //     News news = standardSerializers.deserializeWith(
//   //       News.serializer, jsonDecode(res.body));

//   //   return news;
//   // }

//   Future<Null> _updateNewsArticle(NewsArticleType type) async {
//     bool fetch = false;
//     if ((type == NewsArticleType.SportArticles && _sportArticles.isEmpty) ||
//         (type == NewsArticleType.HealthArticles && _healthArticles.isEmpty))
//       fetch = true;

//     if (fetch) {
//       var articleStrings = await initNewsArticles(type);
//       type == NewsArticleType.SportArticles
//           ? _sportArticlesauthor = articleStrings
//           : _healthArticlesauthor = articleStrings;

//       for (var author in articleStrings) {
//         News newsArticle = await _getNewsArticles(author);
//         type == NewsArticleType.SportArticles
//             ? _sportArticlesauthor.add(newsArticle)
//             : _healthArticlesauthor.add(newsArticle);
//             notifyListeners();
//         // if (articleStrings.indexOf(author) > 2) notifyListeners();
//         // if (articleStrings.indexOf(author) > 10) break;
//       }
//       type == NewsArticleType.SportArticles
//           ? _sportsIsLoading = false
//           : _healthIsLoading = false;
//       notifyListeners();
//     }
//   }
// }

class HttpService with ChangeNotifier {
 static Future<News> getSportsNews() async {
   
    final String sportsurl =
        'http://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=7b2380f2052e4b2c9223e21021914f2e';
    //naija news
    //'https://newsapi.org/v2/top-headlines?country=ng&apiKey=7b2380f2052e4b2c9223e21021914f2e';
    final res = await http.get(sportsurl);

    News sportsnews = standardSerializers.deserializeWith(
        News.serializer, jsonDecode(res.body));
    
    print("SportsNews total" + sportsnews.totalResults.toString());
    return sportsnews;
  }

 static Future<News> getHealthNews() async {
   
    final String healthurl =
        'http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=7b2380f2052e4b2c9223e21021914f2e';
    final res = await http.get(healthurl);

    News healthnews = standardSerializers.deserializeWith(
        News.serializer, jsonDecode(res.body));
    
    print("HealthNews total" + healthnews.totalResults.toString());
    return healthnews;
  }
 
}
