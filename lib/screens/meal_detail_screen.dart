import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //User selected this meal
    final String mealId = ModalRoute.of(context).settings.arguments;

    //Getting All the Dummy Meals having this mealId
    //firstWhere : for finding only one meal
    final selectedMeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });

    Widget sectionTitle(String title) {
      return Container(
        padding: EdgeInsets.only(top: 15, left: 30),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      );
    }

    Widget respectiveSectionList(List<String> sectionList) {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        height: 200,
        width: 300,
        child: ListView.builder(
          itemCount: sectionList.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.only(left: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(0.1),
                title: Text("${index + 1}. " + sectionList[index]),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle("Ingredients :"),
            respectiveSectionList(selectedMeal.ingredients),
            sectionTitle("Steps :"),
            respectiveSectionList(selectedMeal.steps),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
