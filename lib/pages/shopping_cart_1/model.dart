import 'package:pagger/library/library.dart';

class Cart {
  int id;
  int quantity;
  int categoryId;
  String name;
  String category;
  String image;
  String description;
  double price;
  double rating;
  bool isFavorite;

  Cart(this.id, this.name, this.category, this.image, this.price, this.rating, this.categoryId, this.isFavorite, this.quantity, this.description);

  bool canIncrease() {
    return quantity < 12;
  }

  bool canDecrease() {
    return quantity > 1;
  }

  bool canRemove() {
    return quantity == 1;
  }

  factory Cart.fromJSON(dynamic json) {
    final JsonObject jsonObject = JsonObject.from(json);
    final String name = jsonObject.getString('name');
    final String image = jsonObject.getString('image');
    final String category = jsonObject.getString('category');
    final double price = jsonObject.getDouble('price');
    final double rating = jsonObject.getDouble('rating');
    final int categoryId = jsonObject.getInt('category_id');
    final bool isFavorite = jsonObject.getBool('is_favorite');
    final int quantity = jsonObject.getInt('quantity');
    final String description = jsonObject.getString('description');

    return Cart(jsonObject.getId, name, category, image, price, rating, categoryId, isFavorite, quantity, description);
  }
}
