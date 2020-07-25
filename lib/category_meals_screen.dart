import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map routArgs = ModalRoute.of(context).settings.arguments;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final Color categoryColor = routArgs['color'];

    //filter only same id types
    final categoryMeals = DUMMY_MEALS.where((eachMeal) {
      return eachMeal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
        ));
  }
}
