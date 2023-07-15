import 'package:flutter/material.dart';
import 'package:meal_app/model/catogory.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onselected});
  final Categoery category;
  final void Function() onselected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselected,
      borderRadius: BorderRadius.circular(30),
      splashColor: Theme.of(context).shadowColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}
