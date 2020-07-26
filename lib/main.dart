import 'package:flutter/material.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';

import 'screens/categories_screen.dart';

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
            )),
      ),
      routes: {
        '/categories': (ctx) {
          return CategoryMealsScreen();
        },
        /*'/meal-Detail': (ctx) {
          return MealDetailScreen();
        }*/
      },

      //it loads CategoriesScreen() if in routs there is no required
      //rout is available as long as we are calling named routs
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) {
          return CategoriesScreen();
        });
      },

      //When flutter not found any page in its stack it
      //try to run onUnknownRoute to show something on Screen
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) {
          return CategoriesScreen();
        });
      },
    ),
  );
}
