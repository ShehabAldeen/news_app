import 'package:flutter/material.dart';
import 'package:newsapp2/api_manager/response.dart';
import 'package:newsapp2/details_screen/news_item.dart';
import 'package:newsapp2/home/home_page.dart';

import '../api_manager/article.dart';
import '../search/news_title.dart';
import 'home_page.dart';

class NewsListWidget extends StatelessWidget {
  String? q;
  static int currentIndexofListViews = 0;

  NewsListWidget({this.q});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DataResponse.fetchArticles(
            HomePage.CurrentCategory?.categoryName ?? '', q ?? ""),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          Articles? data = snapshot.data;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (buildContext, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsTitle(data!)),
                      );
                      currentIndexofListViews = index;
                    },
                    child: NewsItem(data!, index));
              },
              itemCount: data?.articles?.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}
