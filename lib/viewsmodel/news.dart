

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:nigeriannews/model/articles.dart';
import 'package:nigeriannews/model/serializers.dart';
import 'dart:convert';



class HttpService with ChangeNotifier {
 static Future<News> getSportsNews() async {
   
    final String sportsurl =
        'http://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=7b2380f2052e4b2c9223e21021914f2e';
   
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

  static Future<News> getEntertainmentNews()async{
   final String entertainUrl = 'http://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=7b2380f2052e4b2c9223e21021914f2e';
   final res =await http.get(entertainUrl);

   News entertainnews = standardSerializers.deserializeWith(News.serializer, jsonDecode(res.body));

   print("entertainNews total" + entertainnews.totalResults.toString());
   return entertainnews;
  }
  
  static Future<News> getTechnologyNews()async{
   final String techUrl = 'http://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=7b2380f2052e4b2c9223e21021914f2e';
   final res =await http.get(techUrl);

   News technologynews = standardSerializers.deserializeWith(News.serializer, jsonDecode(res.body));

   print("technologynews total" + technologynews.totalResults.toString());
   return technologynews;
  }
 
}
