import 'package:flutter/material.dart';

enum filtertheitems {
  isglutonfree,
  islactosfree,
  isvegetarianfree,
  isveganfree
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

bool isglutonchanged = false;
bool islactosechanged = false;
bool isvegetarianchanged = false;
bool isveganchanged = false;

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yours Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filtertheitems.isglutonfree: isglutonchanged,
            filtertheitems.islactosfree: islactosechanged,
            filtertheitems.isvegetarianfree: isvegetarianchanged,
            filtertheitems.isveganfree: isveganchanged,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: isglutonchanged,
              onChanged: (value) {
                setState(() {
                  isglutonchanged = value;
                });
              },
              title: Text(
                "Is gluton Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only includes gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(20),
            ),
            SwitchListTile(
              value: islactosechanged,
              onChanged: (value) {
                setState(() {
                  islactosechanged = value;
                });
              },
              title: Text(
                "Is Lactose Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only includes Lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(20),
            ),
            SwitchListTile(
              value: isvegetarianchanged,
              onChanged: (value) {
                setState(() {
                  isvegetarianchanged = value;
                });
              },
              title: Text(
                "Is Vegetarian Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only includes Vegetarian-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(20),
            ),
            SwitchListTile(
              value: isveganchanged,
              onChanged: (value) {
                setState(() {
                  isveganchanged = value;
                });
              },
              title: Text(
                "Is Vegan Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only includes vegan-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.all(20),
            )
          ],
        ),
      ),
    );
  }
}
