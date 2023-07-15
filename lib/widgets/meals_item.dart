import 'package:flutter/material.dart';
import 'package:meal_app/model/Meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.fill,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
