import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome to project flutter'),
      ),
    );
  }
}
