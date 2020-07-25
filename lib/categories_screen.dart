import 'package:flutter/material.dart';

import 'category_item.dart';
import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dinner Time",
        ),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 17,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.all(25),
        children: <Widget>[
          ...DUMMY_CATEGORIES.map((eachCategoryItem) {
            return CategoryItem(
              id: eachCategoryItem.id,
              title: eachCategoryItem.title,
              color: eachCategoryItem.color,
            );
          }).toList()
        ],
      ),
    );
  }
}
