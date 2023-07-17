import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/Meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool ontoggeledmeal(Meal meal) {
    final toggedmeal = state.contains(meal);

    if (toggedmeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final statenotifierprovider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(((ref) {
  return FavoriteMealNotifier();
}));
