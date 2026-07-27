class Item {
  int? id;
  String name;
  int quantity;
  String category;
  String expiry;

  Item({
    this.id,
    required this.name,
    required this.quantity,
    required this.category,
    required this.expiry,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'category': category,
      'expiry': expiry,
    };
  }
}