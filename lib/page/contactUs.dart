import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Contact Us Page',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
