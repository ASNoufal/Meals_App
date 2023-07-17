import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filterprovider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ischanged = ref.watch(filterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yours Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: ischanged[filtertheitems.isglutonfree]!,
            onChanged: (value) {
              ref
                  .read(filterprovider.notifier)
                  .filteritems(filtertheitems.isglutonfree, value);
            },
            title: Text(
              "Is gluton Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only includes gluten-free meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.all(20),
          ),
          SwitchListTile(
            value: ischanged[filtertheitems.islactosfree]!,
            onChanged: (value) {
              ref
                  .read(filterprovider.notifier)
                  .filteritems(filtertheitems.islactosfree, value);
            },
            title: Text(
              "Is Lactose Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only includes Lactose-free meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.all(20),
          ),
          SwitchListTile(
            value: ischanged[filtertheitems.isveganfree]!,
            onChanged: (value) {
              ref
                  .read(filterprovider.notifier)
                  .filteritems(filtertheitems.isveganfree, value);
            },
            title: Text(
              "Is Vegetarian Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only includes Vegetarian-free meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.all(20),
          ),
          SwitchListTile(
            value: ischanged[filtertheitems.isvegetarianfree]!,
            onChanged: (value) {
              ref
                  .read(filterprovider.notifier)
                  .filteritems(filtertheitems.isvegetarianfree, value);
            },
            title: Text(
              "Is Vegan Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only includes vegan-free meals",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.all(20),
          )
        ],
      ),
    );
  }
}
