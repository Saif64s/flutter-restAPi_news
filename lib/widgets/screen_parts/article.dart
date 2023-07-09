import 'package:flutter/material.dart';
import 'package:news_rest_api/screens/blog_details.dart';
import 'package:news_rest_api/widgets/article_widget.dart';

import '../../model/news_model.dart';
import '../../services/news_api_service.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  List<NewsModel> newsList = [];

  Future<List<NewsModel>> getNewsList() async {
    List<NewsModel> newsList = await getNews();
    return newsList;
  }

  @override
  void didChangeDependencies() {
    getNewsList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: getNewsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, idx) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NewsDetailsScreen.routeName);
                    },
                    child: ArticleWidget(
                      imageUrl: snapshot.data![idx].urlToImage!,
                      date: snapshot.data![idx].publishedAt!,
                      link: snapshot.data![idx].url!,
                      title: snapshot.data![idx].title!,
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
