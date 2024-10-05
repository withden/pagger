// Base
import 'dart:convert';

// Dummy database store
class Database {
  static String categories = jsonEncode([
    {"id": 1, "name": "Dress", "image": "assets/images/shopping/categories/dress.png"},
    {"id": 2, "name": "Jackets", "image": "assets/images/shopping/categories/jacket.png"},
    {"id": 3, "name": "kurti", "image": "assets/images/shopping/categories/kurti.png"},
    {"id": 4, "name": "ring", "image": "assets/images/shopping/categories/ring.png"},
    {"id": 5, "name": "Shirts", "image": "assets/images/shopping/categories/shirt.png"},
    {"id": 6, "name": "Shoes", "image": "assets/images/shopping/categories/shoes.png"},
    {"id": 7, "name": "T-shirts", "image": "assets/images/shopping/categories/t-shirt.png"},
    {"id": 8, "name": "watch", "image": "assets/images/shopping/categories/watch.png"},
  ]);

  static String products = jsonEncode([
    {
      "id": 1,
      "category_id": 1,
      "name": "Floral Dress",
      "price": 49.99,
      "category": "Dress",
      "rating": 4.5,
      "image": "assets/images/shopping/products/products_1.jpg"
    },
    {
      "id": 2,
      "category_id": 2,
      "name": "Casual Jacket",
      "price": 19.99,
      "category": "Jacket",
      "rating": 4.0,
      "image": "assets/images/shopping/products/products_2.jpg"
    },
    {
      "id": 3,
      "category_id": 3,
      "name": "Denim kurti",
      "price": 69.99,
      "category": "kurti",
      "rating": 4.8,
      "image": "assets/images/shopping/products/products_3.jpg"
    },
    {"id": 4, "category_id": 4, "name": "Ring", "price": 78.99, "category": "Ring", "rating": 4.3, "image": "assets/images/shopping/products/products_4.jpg"},
    {
      "id": 5,
      "category_id": 5,
      "name": "Summer Hat",
      "price": 24.99,
      "category": "Shirt",
      "rating": 4.2,
      "image": "assets/images/shopping/products/products_5.jpg"
    },
    {"id": 6, "category_id": 6, "name": "Shoes", "price": 89.99, "category": "Shoes", "rating": 4.7, "image": "assets/images/shopping/products/products_6.jpg"},
    {
      "id": 7,
      "category_id": 7,
      "name": "T-shirt",
      "price": 34.99,
      "category": "T-shirt",
      "rating": 4.4,
      "image": "assets/images/shopping/products/products_7.jpg"
    },
    {"id": 8, "category_id": 8, "name": "Rado", "price": 79.99, "category": "Watch", "rating": 4.6, "image": "assets/images/shopping/products/products_8.jpg"},
  ]);
}
