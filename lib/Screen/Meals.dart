import 'package:flutter/material.dart';
import 'package:meal_app/Screen/meals_detais.dart';
import 'package:meal_app/model/Meal.dart';
import 'package:meal_app/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, this.titles, required this.meals, required this.ontoggeled});
  final String? titles;
  final List<Meal> meals;
  final Function(Meal meal) ontoggeled;
  void selectmeal(BuildContext context, Meal meal) {
    Navigator.push(
        (context),
        MaterialPageRoute(
            builder: (context) => MealsDetais(
                  meal: meal,
                  ontoggeled: ontoggeled,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealsItem(
              meal: meals[index],
              onselectedMeal: (meal) {
                selectmeal(context, meal);
              });
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
    if (titles == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            titles!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: content);
  }
}
