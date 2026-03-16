class Item1 {
  final String name;
  final int id;
  final bool favourite;

  Item1({required this.name, required this.id, required this.favourite});

  Item1 copyWith({String? name, int? id, bool? favourite}) {
    return Item1(
      name: name ?? this.name,
      id: id ?? this.id,
      favourite: favourite ?? this.favourite,
    );
  }
}
