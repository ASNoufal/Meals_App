import 'package:flutter/material.dart';
import 'package:meal_app/model/Meal.dart';
import 'package:meal_app/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.titles, required this.meals});
  final String titles;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealsItem(
            meal: meals[index],
          );
        });
    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No items found",
              style: TextStyle(color: Colors.blue),
              // style: Theme.of(context)
              //     .textTheme
              //     .bodyLarge!
              //     .copyWith(color: Theme.of(context).colorScheme.background),
            )
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            titles,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: content);
  }
}
