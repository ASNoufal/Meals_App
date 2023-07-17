import 'package:meal_app/demodata/demidata.dart';
import 'package:riverpod/riverpod.dart';

final mealprovider = Provider((ref) => dummyMeals);
