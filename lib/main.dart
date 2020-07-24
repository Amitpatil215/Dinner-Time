import 'package:flutter/material.dart';

import 'categories_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: CategoriesScreen(),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Colors.white,
          fontFamily: 'GoogleSans',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.red),

              //title
              headline6: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ))),
    ),
  );
}
