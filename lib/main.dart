import 'package:flutter/material.dart';
import 'homepage_state.dart';

void main() => runApp(new MyApp());

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }


}

