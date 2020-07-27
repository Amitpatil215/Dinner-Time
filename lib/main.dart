import 'package:flutter/material.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';
//import 'screens/categories_screen.dart';

void main() {
  runApp(
    MaterialApp(
      //is we passing '/' in routs as home is equivalent to it
      //home: CategoriesScreen(),
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
            )),
      ),
      routes: {
        //equivalent to home: argument in MaterialApp()
        '/': (ctx) {
          return TabScreen();
        },
        '/categories': (ctx) {
          return CategoryMealsScreen();
        },
        '/meal-Detail': (ctx) {
          return MealDetailScreen();
        }
      },
    ),
  );
}
