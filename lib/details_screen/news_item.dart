import 'package:flutter/material.dart';
import 'package:newsapp2/api_manager/article.dart';
import 'package:newsapp2/custom_classes/custom_text.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  int index;
  double? sizeBoxHeight;
  Widget? generalWidget;

  NewsItem(this.article, this.index, {this.sizeBoxHeight, this.generalWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                article.articles?.elementAt(index).urlToImage ?? "",
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 10.0,
          ),
          CustomText(
            text: article.articles?.elementAt(index).source?.name ?? '',
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: article.articles?.elementAt(index).title ?? "",
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: sizeBoxHeight ?? 10.0,
          ),
          CustomText(
            text: article.articles?.elementAt(index).description ?? "",
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          generalWidget ??
              Divider(
                thickness: 3,
                color: Colors.orange,
              ),
        ],
      ),
    );
  }
}
