import 'package:flutter/material.dart';
import '../page/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[100],
          ),
          Positioned(
            top: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sign Up Here',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 270,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 350,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.pink,
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Positioned(
            top: 420,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Or Sign In', style: TextStyle(color: Colors.pink)),
              ),
            ),
          ),
          Positioned(
            top: 480,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(
                    'Click Me For Sign In',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    debugPrint("Clicked");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
