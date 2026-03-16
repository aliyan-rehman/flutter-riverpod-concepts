
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/favourite_app/model/item1.dart';

class FavouriteState {
  final List<Item1> allItems;
  final List<Item1> filteredItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<Item1>? allItems,
    List<Item1>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
