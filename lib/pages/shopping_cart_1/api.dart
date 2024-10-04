import 'package:pagger/library/library.dart';

import 'database.dart';
import 'model.dart';

class CartAPI {
  static List<Cart>? _cached;

  static List<Cart> listFromJSON(String json) {
    final JsonList jsonList = JsonList.from(json);
    return jsonList.list.map((e) => Cart.fromJSON(e)).toList();
  }

  static Future<List<Cart>> getCarts() async {
    _cached ??= listFromJSON(await fetchAPI());
    return _cached!;
  }

  static Future<String> fetchAPI() async {
    return Database.carts;
  }
}
