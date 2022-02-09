import 'package:flutter/material.dart';
import 'package:newsapp2/custom_classes/custom_appbar_shape.dart';
import 'package:newsapp2/home/home_page.dart';
import 'package:newsapp2/home/news_list_widget.dart';

class SearchScreen extends StatefulWidget {
  static final routName = 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? q;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        shape: CustomAppBarShape.appBareShape(),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.routName);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.green,
                    )),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  onChanged: (textSearch) {
                    q = textSearch;
                  },
                  decoration: InputDecoration(
                      hintText: 'search for articles',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(57, 165, 82, 1.0),
                      ),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
          child: NewsListWidget(
            q: q,
          )),
    );
  }
}
