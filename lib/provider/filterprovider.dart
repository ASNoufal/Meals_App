import 'package:meal_app/provider/mealprovider.dart';
import 'package:riverpod/riverpod.dart';

enum filtertheitems {
  isglutonfree,
  islactosfree,
  isvegetarianfree,
  isveganfree
}

class FilterproviderNotifier extends StateNotifier<Map<filtertheitems, bool>> {
  FilterproviderNotifier()
      : super({
          filtertheitems.isglutonfree: false,
          filtertheitems.islactosfree: false,
          filtertheitems.isveganfree: false,
          filtertheitems.isvegetarianfree: false
        });
  void filteritemss(Map<filtertheitems, bool> ischecked) {
    state = ischecked;
  }

  void filteritems(filtertheitems isfilter, bool isActive) {
    state = {...state, isfilter: isActive};
  }
}

final filterprovider =
    StateNotifierProvider<FilterproviderNotifier, Map<filtertheitems, bool>>(
        (ref) => FilterproviderNotifier());

final filteredmealprovider = Provider((ref) {
  final meal = ref.read(mealprovider);
  final activefilters = ref.watch(filterprovider);
  return meal.where((meal) {
    if (activefilters[filtertheitems.isglutonfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[filtertheitems.islactosfree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[filtertheitems.isveganfree]! && !meal.isVegan) {
      return false;
    }
    if (activefilters[filtertheitems.isvegetarianfree]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
