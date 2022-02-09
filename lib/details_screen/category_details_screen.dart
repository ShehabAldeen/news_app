import 'package:flutter/material.dart';
import 'package:newsapp2/api_manager/news_sources.dart';
import 'package:newsapp2/api_manager/response.dart';
import 'package:newsapp2/details_screen/category_tabs.dart';
import 'package:newsapp2/home/category.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryType category;

  CategoryDetailsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DataResponse.fetchSources(category.categoryName),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.hasError.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          Sources? data = snapshot.data;
          return CategoryTabs(data?.sources ?? []);
        },
      ),
    );
  }
}
