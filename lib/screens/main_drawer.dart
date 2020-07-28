import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget listTilesDrawer(String inputTitle, IconData inputIcon) {
    return ListTile(
      leading: Icon(inputIcon),
      title: Text(
        inputTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.indigo,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          listTilesDrawer("Meals", Icons.restaurant),
          listTilesDrawer("Filters", Icons.filter),
        ],
      ),
    );
  }
}
