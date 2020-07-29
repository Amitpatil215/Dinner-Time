import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no \nFavorites",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w100,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            removeItem: null,
          );
        },
      );
    }
  }
}
