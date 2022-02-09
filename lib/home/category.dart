import 'package:flutter/material.dart';

class CategoryType extends StatelessWidget {
  String id;
  String categoryName;
  String imagePath;
  Color background;
  int index;

  CategoryType(
      this.id, this.categoryName, this.imagePath, this.background, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 12),
            bottomLeft: Radius.circular(index % 2 == 0 ? 12 : 0),
          )),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.150,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Text(categoryName, style: Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }
}
