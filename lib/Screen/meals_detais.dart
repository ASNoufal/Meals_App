import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/stateprovider.dart';
import 'package:meal_app/model/Meal.dart';

class MealsDetais extends ConsumerWidget {
  const MealsDetais({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        // fff
        actions: [
          IconButton(
              onPressed: () {
                final read = ref
                    .read(statenotifierprovider.notifier)
                    .ontoggeledmeal(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text(read ? "favoraite added" : "removed favorite")));
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(meal.imageUrl),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingrediants in meal.ingredients)
              Text(
                ingrediants,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).hintColor),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  step,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).primaryColorLight),
                ),
              )
          ],
        ),
      ),
    );
  }
}
