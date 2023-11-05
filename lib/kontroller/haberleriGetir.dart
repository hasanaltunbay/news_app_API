

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/haberler/haberler.dart';

class GetHaberler{
  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];
  static Future<Haberler> getHaberler()async{
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];

    Response response = await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=be4b52bf2f404f249a8f6f094d17f7c1"));

    Map veri = jsonDecode(response.body);
    List articles = veri["articles"];

    final _Newrandom = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];

    return Haberler.fromJson(myArticle);


  }
}