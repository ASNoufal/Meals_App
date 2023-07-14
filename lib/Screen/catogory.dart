import 'package:flutter/material.dart';
import 'package:meal_app/Screen/Meals.dart';
import 'package:meal_app/demodata/demidata.dart';
import 'package:meal_app/widgets/catogory_grid_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void selectcatogory(BuildContext context) {
    Navigator.push(
        (context),
        MaterialPageRoute(
          builder: (context) => MealsScreen(titles: "some thing", meals: []),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pick up your catogory"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30),
        children: [
          // availablecatogory.map((catogory) =>  CategoryGridItem(category: catogory)).toList()
          for (final catogory in availableCategories)
            CategoryGridItem(
              category: catogory,
              onselected: selectcatogory,
            )
        ],
      ),
    );
  }
}
