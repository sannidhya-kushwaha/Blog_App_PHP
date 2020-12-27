import 'dart:convert';

import 'package:Blog_App_PHP/page/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelectCategoryBy extends StatefulWidget {
  final categoryName;
  SelectCategoryBy({this.categoryName});
  @override
  _SelectCategoryByState createState() => _SelectCategoryByState();
}

class _SelectCategoryByState extends State<SelectCategoryBy> {
  List categoryByPost = List();
  Future categoryByData() async {
    var url = "http://192.168.43.212/Blog_App_PHP/categoryByPost.php";
    var response = await http.post(url, body: {'name': widget.categoryName});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryByPost = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    categoryByData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: categoryByPost.length,
          itemBuilder: (context, index) {
            return NewPostItem(
              author: categoryByPost[index]['author'],
              body: categoryByPost[index]['body'],
              categoryName: categoryByPost[index]['categoryName'],
              comments: categoryByPost[index]['comments'],
              image:
                  'http://192.168.43.212/Blog_App_PHP/uploads/${categoryByPost[index]['image']}',
              postDate: categoryByPost[index]['post_date'],
              totalLike: categoryByPost[index]['total_like'],
              createDate: categoryByPost[index]['create_date'],
              title: categoryByPost[index]['title'],
            );
          },
        ),
      ),
    );
  }
}

class NewPostItem extends StatefulWidget {
  final image;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;
  NewPostItem(
      {this.image,
      this.author,
      this.postDate,
      this.comments,
      this.totalLike,
      this.title,
      this.body,
      this.categoryName,
      this.createDate});
  @override
  _NewPostItemState createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.amber, Colors.pink],
              ),
            ),
            // color: Colors.amber,
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: CircleAvatar(
            radius: 20,
            // child: Icon(Icons.person),
            backgroundImage: NetworkImage(widget.image),
          ),
        ),
        Positioned(
          top: 30,
          left: 80,
          child: Text(widget.author,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue')),
        ),
        Positioned(
          top: 30,
          left: 150,
          child: Text(widget.postDate,
              style:
                  TextStyle(color: Colors.grey[200], fontFamily: 'BebasNeue')),
        ),
        Positioned(
          top: 50,
          left: 100,
          child: Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 50,
          left: 140,
          child: Text(widget.comments,
              style:
                  TextStyle(color: Colors.grey[200], fontFamily: 'BebasNeue')),
        ),
        Positioned(
          top: 50,
          left: 170,
          child: Icon(
            Icons.label,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 50,
          left: 200,
          child: Text(widget.totalLike,
              style:
                  TextStyle(color: Colors.grey[200], fontFamily: 'BebasNeue')),
        ),
        Positioned(
          top: 100,
          left: 30,
          child: Text(widget.title,
              style:
                  TextStyle(color: Colors.grey[200], fontFamily: 'BebasNeue')),
        ),
        Positioned(
          top: 146,
          left: 30,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        Positioned(
          top: 150,
          left: 60,
          child: InkWell(
            child: Text(
              "Read More",
              style:
                  TextStyle(color: Colors.grey[200], fontFamily: 'BebasNeue'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetails(
                    title: widget.title,
                    image: widget.image,
                    author: widget.author,
                    body: widget.body,
                    postDate: widget.postDate,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
