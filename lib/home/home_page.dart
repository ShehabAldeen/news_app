import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/details_screen/category_details_screen.dart';
import 'package:newsapp2/home/category.dart';
import 'package:newsapp2/home/catergoies.dart';
import 'package:newsapp2/search/search_screen.dart';

import '../custom_classes/custom_appbar_shape.dart';

class HomePage extends StatefulWidget {
  static final routName = 'homePage';
  static CategoryType? CurrentCategory;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/pattern.png',
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              selectedCategory != null
                  ? selectedCategory!.categoryName
                  : 'News app',
            ),
            shape: CustomAppBarShape.appBareShape(),
            actions: [
              selectedCategory != null
                  ? Container(
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SearchScreen(),
                              ),
                            );
                          },
                          child: Icon(Icons.search)))
                  : Container(),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.08),
                    width: double.infinity,
                    child: Text(
                      'News App!',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                rowDrawer(
                    text: 'Categories', icon: Icons.list, context: context),
                rowDrawer(
                    text: 'Settings', icon: Icons.settings, context: context),
              ],
            ),
          ),
          body: Container(
              margin: EdgeInsets.symmetric(
                  //  vertical:MediaQuery.of(context).size.height*0.05,
                  //  horizontal:MediaQuery.of(context).size.width*0.05,
                  ),
              child: selectedCategory == null
                  ? Categories(onCategoryClickCallback)
                  : CategoryDetailsScreen(selectedCategory!)),
        )
      ],
    );
  }

  CategoryType? selectedCategory = null;

  void onCategoryClickCallback(CategoryType category) {
    setState(() {
      selectedCategory = category;
      HomePage.CurrentCategory = selectedCategory;
    });
  }

  Widget rowDrawer(
      {required String text,
      required IconData icon,
      required BuildContext context}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 15, bottom: 8),
          child: InkWell(
              onTap: () {
                selectedCategory = null;
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(
                icon,
                size: 40,
                color: Color.fromRGBO(48, 48, 48, 1.0),
              )),
        ),
        Text(text,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Color.fromRGBO(48, 48, 48, 1.0),
                ))
      ],
    );
  }
}
