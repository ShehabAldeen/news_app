import 'package:flutter/material.dart';

import 'category.dart';

class Categories extends StatelessWidget {
  Function callbackToGetCategory;

  Categories(this.callbackToGetCategory);

  List<CategoryType> categoryList = [
    CategoryType(
      'id',
      'sports',
      'assets/images/sports.png',
      Color.fromRGBO(201, 28, 34, 1.0),
      0,
    ),
    CategoryType('id', 'General', 'assets/images/politics.png',
        Color.fromRGBO(0, 62, 144, 1.0), 1),
    CategoryType('id', 'entertainment', 'assets/images/enviroment.png',
        Color.fromRGBO(72, 130, 207, 1.0), 2),
    CategoryType('id', 'health', 'assets/images/health.png',
        Color.fromRGBO(237, 30, 121, 1.0), 3),
    CategoryType('id', 'science', 'assets/images/science.png',
        Color.fromRGBO(242, 211, 82, 1.0), 4),
    CategoryType('id', 'business', 'assets/images/business.png',
        Color.fromRGBO(207, 126, 72, 1.0), 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pick your category of interest',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Color.fromRGBO(79, 90, 105, 1.0),
              ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
            ),
            itemBuilder: (buildContext, index) {
              return InkWell(
                  onTap: () {
                    callbackToGetCategory(categoryList[index]);
                  },
                  child: categoryList[index]);
            },
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
