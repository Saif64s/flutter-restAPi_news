import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_rest_api/consts/api_vars.dart';

import 'package:news_rest_api/model/news_model.dart';

// import 'package:news_rest_api/model/news_model.dart';

class NewsApiService {}

Future<List<NewsModel>> getNews() async {
  // var url = Uri.parse(
  //     'https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=');
  var uri = Uri.https(BASE_URL, 'v2/everything', {
    "q": "bitcoin",
    "pageSize": "5",
    "domain": "bbc.co.uk,techcrunch.com,engadget.com,verge.com"
  });
  var response = await http.get(uri, headers: {"X-Api-Key": API_KEY});
  // dev.log('Response body: ${response.body}');
  Map data = jsonDecode(response.body);
  List temp = [];

  for (Map val in data["articles"]) {
    // dev.log(val.toString());
    temp.add(val);
  }
  return NewsModel.newsFromSnapshot(temp);
}

Future<List<NewsModel>> getTrendingNews() async {
  // var url = Uri.parse(
  //     'https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=');
  var uri = Uri.https(BASE_URL, 'v2/top-headlines',
      {"q": "bitcoin", "pageSize": "5", "domain": "bbc.co.uk,techcrunch.com"});
  var response = await http.get(uri, headers: {"X-Api-Key": API_KEY});
  // dev.log('Response body: ${response.body}');
  Map data = jsonDecode(response.body);
  List temp = [];

  for (var val in data["articles"]) {
    // dev.log(val.toString());
    temp.add(val);
  }
  return NewsModel.newsFromSnapshot(temp);
}
