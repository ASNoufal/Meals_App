import 'package:flutter/material.dart';
import 'package:meal_app/Screen/Meals.dart';
import 'package:meal_app/demodata/demidata.dart';
import 'package:meal_app/model/Meal.dart';
import 'package:meal_app/model/catogory.dart';
import 'package:meal_app/widgets/catogory_grid_items.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  void selectcatogory(BuildContext context, Categoery catagory) {
    final filteredmeals = widget.availableMeal
        .where((meals) => meals.categories.contains(catagory.id))
        .toList();
    Navigator.push(
        (context),
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            titles: catagory.title,
            meals: filteredmeals,
          ),
        ));
  }

  late AnimationController animationtheme;

  @override
  void initState() {
    super.initState();

    animationtheme = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    animationtheme.forward();
  }

  @override
  void dispose() {
    animationtheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationtheme,
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30),
          children: [
            // availableCategories.map((catogory) =>  CategoryGridItem(category: catogory)).toList();
            for (final catogory in availableCategories)
              CategoryGridItem(
                category: catogory,
                onselected: () {
                  selectcatogory(context, catogory);
                },
              )
          ],
        ),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(
                top: 100 - animationtheme.value * 100,
                left: 100 - animationtheme.value * 100,
                bottom: 100 - animationtheme.value * 100),
            child: child,
          );
        });
  }
}


//SlideTransition(
          //   position: animationtheme.drive(
          //     Tween(
          //       begin: const Offset(0, 0.3),
          //       end: const Offset(0, 0),
          //     ),
          //   ),
          //   child: child,
          // );