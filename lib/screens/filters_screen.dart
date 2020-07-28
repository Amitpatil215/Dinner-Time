import 'package:flutter/material.dart';
import '../screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.saveFilters, this.currentFilters);

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
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['Vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'Vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
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
