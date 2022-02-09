import 'package:http/http.dart' as http;
import 'package:newsapp2/api_manager/news_sources.dart';

import 'article.dart';

class DataResponse {
  static Future<Sources> fetchSources(String category) async {
    http.Response response =
        await http.get(Uri.parse('https://newsapi.org/v2/top-headlines/sources?'
            'category=$category&apiKey=eeb00b620a254626900df08098e73d29'));
    Sources source = sourcesFromJson(response.body);
    if (response.statusCode == 200) {
      return source;
    } else {
      throw Exception(source.message);
    }
  }

  static Future<Articles> fetchArticles(String? category, String? q) async {
    http.Response response =
        await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?'
            'category=$category&q=$q&apiKey=eeb00b620a254626900df08098e73d29'));
    Articles? articles;
    if (response.statusCode == 200) {
      return articlesFromJson(response.body);
    } else {
      throw Exception(articles?.message);
    }
  }
}
