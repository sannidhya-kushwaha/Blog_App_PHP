import 'dart:convert';
import 'package:Blog_App_PHP/page/postDetails.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RecentPostItem extends StatefulWidget {
  @override
  _RecentPostItemState createState() => _RecentPostItemState();
}

class _RecentPostItemState extends State<RecentPostItem> {
  List recentPost = List();

  Future recentPostData() async {
    var url = "http://192.168.43.212/Blog_App_PHP/uploads/postAll.php";
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        recentPost = jsonData;
      });
      print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    super.initState();
    recentPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: recentPost.length,
        itemBuilder: (context, index) {
          return RecentItem(
            title: recentPost[index]['title'],
            author: recentPost[index]['author'],
            date: recentPost[index]['create_date'],
            body: recentPost[index]['body'],
            image:
                "http://192.168.43.212/Blog_App_PHP/uploads/${recentPost[index]['image']}",
          );
        },
      ),
    );
  }
}

class RecentItem extends StatefulWidget {
  final id;
  final title;
  final image;
  final author;
  final date;
  final body;

  RecentItem(
      {this.id, this.title, this.image, this.author, this.date, this.body});

  @override
  _RecentItemState createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetails(
                            image: widget.image,
                            author: widget.author,
                            title: widget.title,
                            postDate: widget.date,
                            body: widget.body),
                      ));
                  debugPrint(widget.title);
                },
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontFamily: 'BebasNeue'),
                ),
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            'by :' + widget.author,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            'posted on :' + widget.date,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Image.network(widget.image, height: 70, width: 70),
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
