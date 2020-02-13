import 'package:http/http.dart' as http;
import 'package:nigeriannews/articles.dart';
import 'dart:convert';

class News {
  List<Article> news = [];

  //String api_key = '7b2380f2052e4b2c9223e21021914f2e';
  Future<void> getNews() async {
    String url ='https://newsapi.org/v2/top-headlines?country=ng&apiKey=7b2380f2052e4b2c9223e21021914f2e';
    var response = await http.get(url);
   
   var jsonData = jsonDecode(response.body);
    
    if (jsonData['status'] == 'ok') {
      
      jsonData['articles'].forEach((element) {
        if(element['urlToImage'] !=null && element['author'] !=null){
           Article article = Article(
             name: element['name'],
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content']);
        news.add(article);
        }
        
      }
    );
   }
  }
}

// class News {
//   List<Article> news = [];

// Future<Article> getNews() async {
//   final response =
//       await http.get('https://newsapi.org/v2/top-headlines?country=ng&apiKey=7b2380f2052e4b2c9223e21021914f2e');

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response, then parse the JSON.
//     return Article.fromJson(json.decode(response.body));
//   } else {
//     // If the server did not return a 200 OK response, then throw an exception.
//     throw Exception('Failed to load post');
//   }
// }}