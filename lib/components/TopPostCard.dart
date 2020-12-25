import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

class TopPostCard extends StatefulWidget {
  @override
  _TopPostCardState createState() => _TopPostCardState();
}

// ============> <==============

class _TopPostCardState extends State<TopPostCard> {
  List postData = List();

  Future showAllPost() async {
    var url = "http://192.168.43.212/Blog_App_PHP/uploads/postAll.php";
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        postData = jsonData;
      });
      print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    super.initState();
    showAllPost();
  }

  // ============> <==============

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      // color: Colors.amber,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: postData.length,
          itemBuilder: (context, index) {
            return NewPostItem(
              author: postData[index]['author'],
              body: postData[index]['body'],
              categoryName: postData[index]['categoryName'],
              comments: postData[index]['comments'],
              image:
                  'http://192.168.43.212/Blog_App_PHP/uploads/${postData[index]['image']}',
              postDate: postData[index]['post_date'],
              totalLike: postData[index]['total_like'],
              createDate: postData[index]['create_date'],
              title: postData[index]['title'],
            );
          }),
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
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
