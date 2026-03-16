import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/favourite_app/model/item1.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/favourite_app/provider/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<Item1> item = [
      Item1(name: "MacBook", id: 1, favourite: true),
      Item1(name: "Iphone", id: 2, favourite: false),
      Item1(name: "Samsung Ultra", id: 3, favourite: true),
      Item1(name: "Google Pixel 9", id: 4, favourite: false),
      Item1(name: "Ipad Pro 13", id: 5, favourite: false),
      Item1(name: "G-Force 3060", id: 6, favourite: true),
    ];

    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  //Filter List when searching
  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItem(state.allItems, search));
  }

  List<Item1> _filterItem(List<Item1> items, String search) {
    if (search.isEmpty) {
      return items;
    }

    return items.where((element) {
      return element.name.toLowerCase().contains(search.toLowerCase());
    }).toList();
  }

  //filter favourite and all by using POPUP MENU BUTTON
  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItem(state.allItems, option),
    );
  }

  List<Item1> _favouriteItem(List<Item1> items, String option) {
    if (option == "All") {
      return items;
    }

    return items.where((element) {
      return element.favourite == true;
    }).toList();
  }
}
