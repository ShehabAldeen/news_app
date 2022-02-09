import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/details_screen/item_tab.dart';
import 'package:newsapp2/home/news_list_widget.dart';

import '../api_manager/article.dart';

class CategoryTabs extends StatefulWidget {
  List<Source> sources;

  CategoryTabs(this.sources);

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                tabs: widget.sources
                    .map((element) => TabItem(
                        element,
                        currentIndex == widget.sources.indexOf(element)
                            ? true
                            : false))
                    .toList()),
            NewsListWidget(),
          ],
        ),
      ),
    );
  }
}
