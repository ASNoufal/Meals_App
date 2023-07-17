import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Screen/Meals.dart';
import 'package:meal_app/Screen/catogory.dart';
import 'package:meal_app/Screen/filters.dart';
import 'package:meal_app/provider/mealprovider.dart';
import 'package:meal_app/provider/stateprovider.dart';

import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/provider/filterprovider.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

int selectedindex = 0;

class _TabsState extends ConsumerState<Tabs> {
  @override
  Widget build(BuildContext context) {
    final mealriverpod = ref.watch(mealprovider);
    final activefilters = ref.watch(filterprovider);

    final availblescreen = mealriverpod.where((meal) {
      if (activefilters[filtertheitems.isglutonfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilters[filtertheitems.islactosfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilters[filtertheitems.isveganfree]! && !meal.isVegan) {
        return false;
      }
      if (activefilters[filtertheitems.isvegetarianfree]! &&
          !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    void ondrawer(String identifier) async {
      Navigator.pop(context);
      if (identifier == "filter") {
        await Navigator.push<Map<filtertheitems, bool>>(context,
            MaterialPageRoute(builder: (context) {
          return const FiltersScreen();
        }));
      }
    }

    Widget titles = const Text("pick up your catogory");
    Widget activepage = CategoriesScreen(
      availableMeal: availblescreen,
    );
    if (selectedindex == 1) {
      final favoritemeal = ref.watch(statenotifierprovider);
      activepage = MealsScreen(
        meals: favoritemeal,
      );
      titles = const Text("Yours Favorites");
    }

    void selectedpage(int index) {
      setState(() {
        selectedindex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: titles,
      ),
      drawer: MainDrawerScreen(
        ondrawer: ondrawer,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: selectedpage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home Page"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites")
        ],
      ),
      body: activepage,
    );
  }
}
