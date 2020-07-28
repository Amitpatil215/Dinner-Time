import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget listTilesDrawer(BuildContext ctx, String inputTitle,
      IconData inputIcon, String routeName) {
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
      onTap: () {
        //Using Replacement instead of stacking on one another
        //Otherwise our Stack will be infinitely growing
        Navigator.of(ctx).pushReplacementNamed(routeName);
      },
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
          listTilesDrawer(context, "Meals", Icons.restaurant, '/'),
          listTilesDrawer(
            context,
            "Filters",
            Icons.filter,
            "/filters-Page",
          ),
        ],
      ),
    );
  }
}
