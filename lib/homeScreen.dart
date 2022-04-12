import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

void main() {
  runApp(homeScreen());
}

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shape"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.mail_outline), onPressed: () {}),
          ],
        ),
        body: Column(
          children: <Widget>[],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(6.0),
                child: IconButton(icon: Icon(Icons.home), onPressed: () {}),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                child: IconButton(icon: Icon(Icons.add_circle_outline_outlined), onPressed: () {}),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                child: IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}