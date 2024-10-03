import 'package:pagger/library/library.dart';

class Category {
  int id;
  String name;
  String image;

  Category(this.id, this.name, this.image);

  factory Category.fromJSON(dynamic json) {
    final JsonObject jsonObject = JsonObject.from(json);
    final String name = jsonObject.getString('name');
    final String image = jsonObject.getString('image');

    return Category(jsonObject.getId, name, image);
  }
}

class Product {
  int id;
  int categoryId;
  String name;
  String category;
  String image;
  double price;
  double rating;
  bool isFavorite;

  Product(this.id, this.name, this.category, this.image, this.price, this.rating, this.categoryId, this.isFavorite);

  factory Product.fromJSON(dynamic json) {
    final JsonObject jsonObject = JsonObject.from(json);
    final String name = jsonObject.getString('name');
    final String image = jsonObject.getString('image');
    final String category = jsonObject.getString('category');
    final double price = jsonObject.getDouble('price');
    final double rating = jsonObject.getDouble('rating');
    final int categoryId = jsonObject.getInt('category_id');
    final bool isFavorite = jsonObject.getBool('is_favorite');

    return Product(jsonObject.getId, name, category, image, price, rating, categoryId, isFavorite);
  }
}
