import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  Color categoryColor;
  var _loadedInitData = false;

  /*
   we can not run context here
    as init state runs to early
    so using didChangeDependencies
    it runs just before build runs
     */
  @override
  void initState() {
    super.initState();
  }

  /*
  Getting error when we not checking didChangeDependencies
  it getting over written by our init state
  as flutter sets state before the didChangeDependencies runs
  that's why our setState() in _removeMeal not working
  so checking if _loadedInitData is false we setting state
  then making it true this is how flutter knows
  our state loaded
  */
  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final Map routArgs = ModalRoute.of(context).settings.arguments;
      categoryTitle = routArgs['title'];
      final categoryId = routArgs['id'];
      final Color categoryColor = routArgs['color'];

      //filter only same id types
      displayMeals = DUMMY_MEALS.where((eachMeal) {
        return eachMeal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  //Removing the meal of id which we got by pop
  //of Category Meals Screen
  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((element) {
        return element.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(categoryTitle),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemCount: displayMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
        ));
  }
}
