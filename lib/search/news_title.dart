import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/api_manager/article.dart';
import 'package:newsapp2/custom_classes/custom_appbar_shape.dart';
import 'package:newsapp2/custom_classes/custom_text.dart';
import 'package:newsapp2/details_screen/news_item.dart';
import 'package:newsapp2/home/home_page.dart';
import 'package:newsapp2/home/news_list_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTitle extends StatelessWidget {
  static final routName = 'newsTitle';
  Articles article;

  NewsTitle(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'News Title',
            fontSize: 22,
            color: Colors.white,
          ),
          centerTitle: true,
          shape: CustomAppBarShape.appBareShape(),
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          leading: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                  (Route<dynamic> route) => false);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: NewsItem(
            article,
            NewsListWidget.currentIndexofListViews,
            sizeBoxHeight: MediaQuery.of(context).size.height * .1,
            generalWidget: Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () async {
                  final url = 'https://newsapi.org/v2/top-headlines?'
                      'sources=bbc-news&apiKey=eeb00b620a254626900df08098e73d29';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'View Full Article',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.article),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
