import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './components/TopPostCard.dart';
import './components/CategoryListItem.dart';
import './components/RecentPostItem.dart';
import './page/aboutUs.dart';
import './page/contactUs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHP Blog App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var curdate = DateFormat("d MMMM y").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.pinkAccent),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                ),
                accountName: Text('Sannidhya Kushwaha'),
                accountEmail: Text('sannidhyakushwaha@gmail.com')),
            ListTile(
              onTap: () {
                debugPrint("Home");
              },
              leading: Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
                debugPrint("About Us");
              },
              leading: Icon(
                Icons.label,
                color: Colors.grey,
              ),
              title: Text(
                'About Us',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUs(),
                  ),
                );
                debugPrint("Contact Us");
              },
              leading: Icon(
                Icons.contacts,
                color: Colors.amber,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(color: Colors.amber),
              ),
            ),
            ListTile(
              onTap: () {
                debugPrint("Login");
              },
              leading: Icon(
                Icons.lock,
                color: Colors.red,
              ),
              title: Text(
                'Login',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
            width: 150,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: menuDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Blogs Today',
              style: TextStyle(fontSize: 25, fontFamily: 'BebasNeue'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  curdate,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BebasNeue',
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.today,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          TopPostCard(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Text(
                'Top Categories',
                style: TextStyle(fontSize: 25, fontFamily: 'BebasNeue'),
              ),
            ),
          ),
          CategoryListItem(),
          RecentPostItem(),
        ],
      ),
    );
  }
}
