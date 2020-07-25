import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map routArgs = ModalRoute.of(context).settings.arguments;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final Color categoryColor = routArgs['color'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: Text("Recipes For Category"),
      ),
    );
  }
}
