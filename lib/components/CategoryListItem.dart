import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../page/SelectCategoryBy.dart';

class CategoryListItem extends StatefulWidget {
  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  List categories = List();

  Future getAllCategory() async {
    var url = "http://192.168.43.212/Blog_App_PHP/categoryAll.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categories = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryName: categories[index]['name'],
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final categoryName;
  CategoryItem({this.categoryName});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            widget.categoryName,
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SelectCategoryBy(categoryName: widget.categoryName),
              ),
            );
            debugPrint(
              widget.categoryName,
            );
          },
        ),
      ),
    );
  }
}
