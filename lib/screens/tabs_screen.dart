import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'main_drawer.dart';
import 'favourite_screen.dart';
import 'categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabScreen(this.favouriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavouritesScreen(widget.favouriteMeals),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinner Time"),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.indigo,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favourites"),
          )
        ],
      ),
    );
  }
}
