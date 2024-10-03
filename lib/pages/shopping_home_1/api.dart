import 'package:pagger/library/library.dart';

import 'database.dart';
import 'model.dart';

class ProductAPI {
  static List<Product>? _cached;

  static List<Product> listFromJSON(String json) {
    final JsonList jsonList = JsonList.from(json);
    return jsonList.list.map((e) => Product.fromJSON(e)).toList();
  }

  static Future<List<Product>> getProducts() async {
    _cached ??= listFromJSON(await fetchAPI());
    return _cached!;
  }

  static Future<String> fetchAPI() async {
    return Database.products;
  }
}

class CategoryAPI {
  static List<Category>? _cached;

  static List<Category> listFromJSON(String json) {
    final JsonList jsonList = JsonList.from(json);
    return jsonList.list.map((e) => Category.fromJSON(e)).toList();
  }

  static Future<List<Category>> getCategories() async {
    _cached ??= listFromJSON(await fetchAPI());
    return _cached!;
  }

  static Future<String> fetchAPI() async {
    return Database.categories;
  }
}
