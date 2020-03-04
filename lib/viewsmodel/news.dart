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

class HttpService{
 static Future<News> getNews()async{
   final String url = 'http://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=7b2380f2052e4b2c9223e21021914f2e';
   //naija news
   //'https://newsapi.org/v2/top-headlines?country=ng&apiKey=7b2380f2052e4b2c9223e21021914f2e';
   final  res = await http.get(url);

    News news = standardSerializers.deserializeWith(News.serializer, jsonDecode(res.body));
   
  print("News total"+ news.totalResults.toString());
  return news;
  }
}
