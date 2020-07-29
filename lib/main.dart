import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';
//import 'screens/categories_screen.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'Vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['Vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealId) {
    //Checking if it is already fav. then we need to remove it
    final existingIndex = _favouriteMeals.indexWhere((element) {
      return element.id == mealId;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    }
    // it will give -1 index if no fav found
    else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((element) {
          return mealId == element.id;
        }));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favouriteMeals.any((element) {
      return element.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          return TabScreen(_favouriteMeals);
        },
        '/categories': (ctx) {
          return CategoryMealsScreen(_availableMeals);
        },
        '/meal-Detail': (ctx) {
          return MealDetailScreen(_toggleFavourites, _isMealFavorite);
        },

        '/filters-Page': (ctx) {
          return FiltersScreen(_setFilters, _filters);
        }
      },
    );
  }
}
