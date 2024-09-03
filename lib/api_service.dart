import 'dart:convert';

import 'package:http/http.dart';
import 'package:pookienews/model/news_model.dart';

class ApiService {
  final all_news_url =
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=cf00eb8f27904f5d8ea16c04a4017d12';

  final breaking_news_url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=cf00eb8f27904f5d8ea16c04a4017d12';

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleslist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      } else {
        throw ("No news found");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleslist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      } else {
        throw ("No news found");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
