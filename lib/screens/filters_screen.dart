import 'package:flutter/material.dart';
import '../screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _filterList({
    String title,
    String description,
    bool curValue,
    Function updateValue,
  }) {
    return Container(
      height: 70,
      child: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text(title),
            subtitle: Text(description),
            value: curValue,
            onChanged: updateValue,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal Selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _filterList(
              title: "Gluten Free",
              description: "Only include Gluten Free Meals",
              curValue: _glutenFree,
              updateValue: (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
          _filterList(
              title: "Lactose Free",
              description: "Only include Lactose Free Meals",
              curValue: _lactoseFree,
              updateValue: (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
          _filterList(
              title: "Vegetarian Food",
              description: "Only include Vegetarian Food",
              curValue: _vegetarian,
              updateValue: (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
          _filterList(
              title: "Vegan",
              description: "Only include Vegan Meals",
              curValue: _vegan,
              updateValue: (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
        ],
      ),
    );
  }
}
