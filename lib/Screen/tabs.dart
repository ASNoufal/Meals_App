import 'package:flutter/material.dart';
import 'package:meal_app/Screen/Meals.dart';
import 'package:meal_app/Screen/catogory.dart';
import 'package:meal_app/model/Meal.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

int selectedindex = 0;
List<Meal> toggeledmeal = [];

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    void showsnackbar(String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    void ontoggeledmeal(Meal meal) {
      final istoggeld = toggeledmeal.contains(meal);
      if (istoggeld) {
        setState(() {
          toggeledmeal.remove(meal);
        });

        showsnackbar("Item removed from favorite");
      } else {
        setState(() {
          toggeledmeal.add(meal);
        });

        showsnackbar("Item added to favorite");
      }
    }

    Widget titles = const Text("pick up your catogory");
    Widget activepage = CategoriesScreen(ontoggeled: ontoggeledmeal);
    if (selectedindex == 1) {
      activepage = MealsScreen(
        meals: toggeledmeal,
        ontoggeled: ontoggeledmeal,
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
