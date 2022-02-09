import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_manager/article.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected = false;

  TabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .02,
          horizontal: MediaQuery.of(context).size.width * .005),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .02,
            horizontal: MediaQuery.of(context).size.width * .03),
        decoration: BoxDecoration(
            color: isSelected == true ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.green, width: 2)),
        child: Text(
          source.name ?? "",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: isSelected == true ? Colors.white : Colors.green,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
