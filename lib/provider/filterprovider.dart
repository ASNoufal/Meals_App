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
